module.exports = {
  apps : [
    {
      name: "c9",
      script: "/cloud9/server.js",
      args: "-l 0.0.0.0 -p 88 -w /apps",
      exec_interpreter: "/opt/node-v6/bin/node",
      autorestart: true,
      max_memory_restart: '500M',
      mergeLogs: false,
      formatted: true,
    }
  ]
};
