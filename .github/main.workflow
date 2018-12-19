workflow "Test Expo Action" {
  on = "push"
  resolves = ["Publish to Expo"]
}

action "Install dependencies" {
  uses = "bycedric/ci-expo/cli@master"
  runs = "npm"
  args = "ci"
}

action "Login with Expo" {
  uses = "bycedric/ci-expo/cli@master"
  secrets = ["EXPO_USERNAME", "EXPO_PASSWORD"]
  args = "login --username $EXPO_USERNAME --password $EXPO_PASSWORD"
}

action "Publish to Expo" {
  uses = "bycedric/ci-expo/cli@master"
  needs = ["Install dependencies", "Login with Expo"]
  args = "publish"
}
