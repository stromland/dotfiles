#!/usr/bin/env zx

import "zx/globals";

const MAC = "darwin"
const LINUX = "linux"
const HOME = os.homedir()

async function setup(fn) {
  const platform = os.platform();

  switch (platform) {
    case "darwin":
    case "linux": {
      try {
        fn(platform);
      } catch (e) {
        echo(e);
      }
      break;
    }
    default:
      echo`${platform} IS NOT SUPPORTED`;
  }
}

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
    files: [".tmux.conf"],
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

copies.forEach(config => {
  setup((platform) => {
    const dst = config.dst[platform]
    fs.ensureDirSync(dst)

    for (let file of config.files) {
      fs.copySync(`./${config.dir}/${file}`, `${dst}/${file}`)
      console.log(`${config.dir}/${file}  ` + chalk.bgGreen.black(' COPIED '))
    }
  })
})

