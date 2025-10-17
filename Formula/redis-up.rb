class RedisUp < Formula
  desc "CLI tool for quickly spinning up Redis development environments"
  homepage "https://github.com/redis-field-engineering/redis-up"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/redis-field-engineering/redis-up/releases/download/v0.1.2/redis-up-aarch64-apple-darwin.tar.xz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
    on_intel do
      url "https://github.com/redis-field-engineering/redis-up/releases/download/v0.1.2/redis-up-x86_64-apple-darwin.tar.xz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/redis-field-engineering/redis-up/releases/download/v0.1.2/redis-up-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  def install
    bin.install "redis-up"
  end

  test do
    assert_match "redis-up", shell_output("#{bin}/redis-up --version")
  end
end
