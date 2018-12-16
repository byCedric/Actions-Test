workflow "Testing project" {
  on = "push"
  resolves = ["Install dependencies"]
}

action "Install dependencies" {
  uses = "bycedric/expo@master"
  args = "ci"
  runs = "npm"
}
