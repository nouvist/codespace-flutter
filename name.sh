infra_channel='stable'
infra='https://storage.googleapis.com/flutter_infra_release/releases'
infra_json="$(curl -s "${infra}/releases_linux.json")"
infra_hash="$(echo ${infra_json} | \
  jq -r ".current_release.${infra_channel}")"
infra_release="$(echo ${infra_json} | \
  jq -r ".releases[] | select(.hash == \"${infra_hash}\")")"
flutter_version="$(echo ${infra_release} | jq -r '.version')"
echo "codespace-flutter:v${flutter_version}-${infra_hash:0:16}"
