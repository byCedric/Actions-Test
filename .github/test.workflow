workflow "Test Expo Action" {
  on = "push"
  resolves = ["Login with Expo", "Publish to Expo"]
}

action "Install dependencies" {
  uses = "bycedric/ci-expo@master"
  runs = "npm"
  args = "ci"
}

action "Publish to Expo" {
  uses = "bycedric/ci-expo/publish@master"
  needs = ["Login with Expo", "Install dependencies"]
}

action "Login with Expo" {
  uses = "bycedric/ci-expo/login@master"
  secrets = ["EXPO_USERNAME", "EXPO_PASSWORD"]
}
