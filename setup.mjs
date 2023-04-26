#!/usr/bin/env zx

import "zx/globals"
import nodemon from "nodemon"

const MAC = "darwin"
const LINUX = "linux"
const HOME = os.homedir()

const filesToCopy = [
  {
    dir: "lazygit",
    files: ["config.yml"],
    dst: {
      [MAC]: `${HOME}/Library/Application Support/lazygit`,
      [LINUX]: `${HOME}/.config/lazygit`,
    } 
  },
  {
    dir: "nvim/nvchad",
    files: ["custom"],
    dst: {
      [MAC]: `${HOME}/.config/nvim/lua`,
      [LINUX]: `${HOME}/.config/nvim/lua`,
    } 
  },
  {
    dir: "tmux",
    files: ["tmux.conf"],
    rename: {
      "tmux.conf": ".tmux.conf"
    },
    dst: {
      [MAC]: HOME,
      [LINUX]: HOME,
    } 
  },
  {
    dir: "tmux",
    files: ["term-status"],
    dst: {
      [MAC]: `${HOME}/bin`,
      [LINUX]: `${HOME}/bin`,
    } 
  }
]

const Log = {
  info: (type, msg = "") => console.log(chalk.bgBlue.black(type) + ` ${msg}`),
  success: (type, msg = "") => console.log(chalk.bgGreen.black(type) + ` ${msg}`),
  error: (type, msg = "") => console.log(chalk.bgRed.black(type) + ` ${msg}`)
}

async function setup(fn) {
  const platform = os.platform()

  switch (platform) {
    case "darwin":
    case "linux": {
      try {
        fn(platform)
      } catch (e) {
        Log.error(" ERROR ", e)
      }
      break;
    }
    default:
      Log.error(" ERROR ", `${platform} IS NOT SUPPORTED`)
  }
}

function handleCopyFiles(config) {
  setup((platform) => {
    const dst = config.dst[platform]
    fs.ensureDirSync(dst)

    for (let file of config.files) {
      const srcFile = `./${config.dir}/${file}`

      if (config.rename?.[file] !== undefined) {
        file = config.rename[file]
      }
      const dstFile = `${dst}/${file}`
      fs.copySync(srcFile, dstFile)
      Log.success('  COPIED  ', `${srcFile} -> ${dstFile}`)
    }
  })
}

function watchFiles() {
  nodemon({
    ext: "*",
    watch: filesToCopy.map(it => it.dir),
    runOnChangeOnly: true,
    exec: "echo"
  })
    .on("watching", (file) => {
      Log.info(" WATCHING ", `${path.relative(__dirname, file)}`)
    })
    .on("quit", (code) => {
      Log.info("  EXIT  ", `status: ${code}`)
      process.exit(code)
    })
    .on("restart", (files) => {
      const file = files[0]
      const dir = path.parse(path.relative(__dirname, file)).dir
      filesToCopy.forEach(config => {
        if (dir.startsWith(config.dir)) {
          handleCopyFiles(config)
        }
      })
    });
}

const [ , mode ] = argv["_"]

switch (mode) {
  case "watch":
    watchFiles()
    break
  case "once":
    filesToCopy.forEach(handleCopyFiles)
    break
  default:
    Log.error(" ERROR ", "Use one of: watch, once")
}

