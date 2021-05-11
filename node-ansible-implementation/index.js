var Ansible = require("node-ansible");
var playbook = new Ansible.Playbook();

playbook.inventory("../hosts");
// let promise = playbook.exec();
// promise.then(
//   function (successResult) {
//     console.log(successResult.code); // Exit code of the executed command
//     console.log(successResult.output); // Standard output/error of the executed command
//   },
//   function (error) {
//     console.error(error);
//   }
// );

async function main(playbookFile) {
  try {
    playbook.playbook(playbookFile);
    let { code, output } = await playbook.exec();
    console.log(code);
  } catch (error) {
    console.error(error.message);
  }
}
// main("../create-user");
// main("../install-docker");
// main("../install-node");
// main("../install-nginx");
main("../mongodb");
