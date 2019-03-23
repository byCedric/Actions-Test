FROM bycedric/ci-expo-fix

LABEL com.github.actions.name="Expo CLI"
LABEL com.github.actions.description="Use Expo CLI in your GitHub Actions workflow."
LABEL com.github.actions.icon="terminal"
LABEL com.github.actions.color="gray-dark"

COPY test.sh /usr/bin/debug
RUN chmod +x /usr/bin/debug
