// swift-tools-version:5.3
import PackageDescription

var binaryTargets: [PackageDescription.Target] = [
  ( 
    "Protobuf_C_",
    "a74e23890cf2093047544e18e999f493cf90be42a0ebd1bf5d4c0252d7cf377a",
    "https://github.com/blinksh/protobuf-apple/releases/download/v3.21.1/Protobuf_C_-static.xcframework.zip"
  ),
  (
    "mosh",
    "acf9a5aebfb5b05da243d5ec914e22d1022c4edf777aceb7e0a9eb46756cd3fa",
    "https://github.com/blinksh/mosh-apple/releases/download/v1.4.0+blink-17.3.0/mosh.xcframework.zip"
  ),
  (
    "LibSSH",
    "f03487ca3affb1d79d1bfb42f6406b92f2f406d9f58acd007b56f1a46af2d1f4",
    "https://github.com/blinksh/libssh-apple/releases/download/v0.9.8/LibSSH-static.xcframework.zip"
  ),
  (
    "OpenSSH",
    "6f6269790435a33c93abbe5ea4e3fe636c3fad6e176332f6f23d6ac9884fdeef",
    "https://github.com/blinksh/openssh-apple/releases/download/v8.9.0/OpenSSH-static.xcframework.zip"
  ),
  (
    "openssl",
    "9a7cc2686122e62445b85a8ce04f49379d99c952b8ea3534127c004b8a00af59",
    "https://github.com/blinksh/openssl-apple/releases/download/v1.1.1k/openssl-dynamic.xcframework.zip"
  ),
  (
    "libssh2",
    "6a14c161ee389ef64dfd4f13eedbdf8628bbe430d686a08c4bf30a6484f07dcb",
    "https://github.com/blinksh/libssh2-apple/releases/download/v1.9.0/libssh2-static.xcframework.zip"
  ),
  (
    "ios_system",
    "50f1692873e73fd862f45f73f2c08745e822c01ff5e0a0e0aec7fed6bb946e7f",
    "https://github.com/holzschu/ios_system/releases/download/v3.0.3/ios_system.xcframework.zip"
  ),
  (
    "awk",
    "428de9776d73b5ef6865b2b0057e962ebe680cff4e977d2cd038455b4728bbac",
    "https://github.com/holzschu/ios_system/releases/download/v3.0.3/awk.xcframework.zip"
  ),
  (
    "files",
    "3224a690a41747bd85e0e5d7868979cc83884e3517b39648e1f6a171ad192e21",
    "https://github.com/holzschu/ios_system/releases/download/v3.0.3/files.xcframework.zip"
  ),
  (
    "shell",
    "7c0c3321155a7e1df609566d6d4d887003cb68f5bf1bcc6eab2ca56f75f46758",
    "https://github.com/holzschu/ios_system/releases/download/v3.0.3/shell.xcframework.zip"
  ),
  (
    "ssh_cmd",
    "c7b197f5aeff4f6ba153b94d979e57916dc99a9afc9c37b394477b513f5fb8cd",
    "https://github.com/holzschu/ios_system/releases/download/v3.0.3/ssh_cmd.xcframework.zip"
  ),
  (
    "tar",
    "8cddd932df4ea609205372c657dee827aa8422fa6d21942d9bf1c7e8148b1ab3",
    "https://github.com/holzschu/ios_system/releases/download/v3.0.3/tar.xcframework.zip"
  ),
  (
    "text",
    "b1244f7612f755d5b1c04252955e37e5a8578c5cc7fd26b28b9bee3294f4e3d1",
    "https://github.com/holzschu/ios_system/releases/download/v3.0.3/text.xcframework.zip"
  ),
  (
    "network_ios",
    "9fe5f119b2d5568d2255e2540f36e76525bfbeaeda58f32f02592ca8d74f4178",
    "https://github.com/holzschu/network_ios/releases/download/v0.3/network_ios.xcframework.zip"
  ),
  (
    "curl_ios",
    "2d5431b38dc7b06ffec13bf1dda208c670c6ceaa391220d875f681392655fead",
    "https://github.com/blinksh/ios_system/releases/download/v3.0.3%2Bblink-17.3.0/curl_ios.xcframework.zip"
  ),
  (
    "bc",
    "e3d72c562f726614e273efb06f6e63ccd23f9e38b14c468cf9febd4302df5fdd",
    "https://github.com/holzschu/bc/releases/download/v1.0/bc_ios.xcframework.zip"
  ),
  (
    "vim",
    "cfe23a176e932c52ce7cceb4e5ea135ef88d5b3bc7e3b92fa9aaa6e534cf253c",
    "https://github.com/blinksh/vim/releases/download/v9.1.0187/vim.xcframework.zip"
  ),
  (
    "xxd",
    "808d0a6404f374bdc21d526856f57a17b1c036d30218f330a0348c9c871ab1fd",
    "https://github.com/blinksh/vim/releases/download/v9.1.0187/xxd.xcframework.zip"
  )
].map { name, checksum, url in PackageDescription.Target.binaryTarget(name: name, url: url, checksum: checksum)}

_ = Package(
  name: "deps",
  platforms: [.macOS("11")],
  dependencies: [
    .package(url: "https://github.com/blinksh/FMake", from: "0.0.15"),
    .package(url: "https://github.com/blinksh/swift-argument-parser", .upToNextMinor(from: "0.5.1")),
    .package(url: "https://github.com/blinksh/SSHConfig", from: "0.0.5"),
  ],
  
  targets: binaryTargets + [
    .target(
      name: "build-project",
      dependencies: ["FMake"]
    ),
  ]
)
