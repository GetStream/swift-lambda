set -eu

executable="Lambda"

echo "preparing docker build image"
docker build . -t builder
echo "done"

echo "building executable"
docker run --rm -v "$(pwd)":/workspace -w /workspace builder bash -cl "swift build --product $executable -c release -Xswiftc -g"
echo "done"

echo "packaging lambda"
docker run --rm -v "$(pwd)":/workspace -w /workspace builder bash -cl "./scripts/package.sh $executable"
