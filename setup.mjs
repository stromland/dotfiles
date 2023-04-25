#!/usr/bin/env zx

import "zx/globals"
import nodemon from "nodemon"

const MAC = "darwin"
const LINUX = "linux"
const HOME = os.homedir()

const [ , mode ] = argv["_"]

const copies = [
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

function error(msg) {
  console.log(chalk.red(msg))
}

async function setup(fn) {
  const platform = os.platform()

  switch (platform) {
    case "darwin":
    case "linux": {
      try {
        fn(platform)
      } catch (e) {
        error(e)
      }
      break;
    }
    default:
      error(`${platform} IS NOT SUPPORTED`)
  }
}

function runSetupForConfig(config) {
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
      console.log(chalk.bgGreen.black('  COPIED  ') + ` ${srcFile} -> ${dstFile}`)
    }
  })
}

function watchFiles() {
  nodemon({
    ext: "*",
    watch: copies.map(it => it.dir),
    runOnChangeOnly: true,
    exec: "echo"
  })
    .on("watching", (file) => {
      console.log(chalk.bgBlue.black(" WATCHING ") + ` ${path.relative(__dirname, file)}`)
    })
    .on("quit", (code) => {
      console.log(chalk.bgYellow.black("  EXIT  "))
      process.exit(code)
    })
    .on("restart", (files) => {
      const file = files[0]
      const dir = path.parse(path.relative(__dirname, file)).dir
      copies.forEach(config => {
        if (dir.startsWith(config.dir)) {
          runSetupForConfig(config)
        }
      })
    });
}

switch (mode) {
  case "watch":
    watchFiles()
    break
  case "once":
    copies.forEach(runSetupForConfig)
    break
  default:
    error("Use one of: watch, once")
}

