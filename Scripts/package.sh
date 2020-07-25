set -eu

executable="Lambda"

target=.build/lambda/$executable
rm -rf "$target"
mkdir -p "$target"
cp ".build/release/$executable" "$target/"
cp -Pv /usr/lib/swift/linux/lib*so* "$target"
cd "$target"
ln -s "$executable" "bootstrap"
zip --symlinks lambda.zip *