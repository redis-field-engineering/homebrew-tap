class RedisUp < Formula
  desc "CLI tool for quickly spinning up Redis development environments"
  homepage "https://github.com/redis-field-engineering/redis-up"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/redis-field-engineering/redis-up/releases/download/redis-up-v0.3.0/redis-up-aarch64-apple-darwin.tar.xz"
      sha256 "dd7ccd447b6bfd97b3dbb9875ef015f78417e02946a7bcd6e331cd6e3bd80118"
    end
    if Hardware::CPU.intel?
      url "https://github.com/redis-field-engineering/redis-up/releases/download/redis-up-v0.3.0/redis-up-x86_64-apple-darwin.tar.xz"
      sha256 "446ddc019dd6c1389d90be97d3d5eaea1dc4d5ac7d21e3111b15ffdc42657d52"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/redis-field-engineering/redis-up/releases/download/redis-up-v0.3.0/redis-up-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "033acb7e386333accf9cd7c06bdd419d9bb0555e444058fa76fa8674564af8fe"
    end
    if Hardware::CPU.intel?
      url "https://github.com/redis-field-engineering/redis-up/releases/download/redis-up-v0.3.0/redis-up-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "77983af02470a3f8e6c5c96d360612066f79d58269afa01122d9bc5fe2b3266b"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "redis-up" if OS.mac? && Hardware::CPU.arm?
    bin.install "redis-up" if OS.mac? && Hardware::CPU.intel?
    bin.install "redis-up" if OS.linux? && Hardware::CPU.arm?
    bin.install "redis-up" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
