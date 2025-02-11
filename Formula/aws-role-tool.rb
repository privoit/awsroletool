class AwsRoleTool < Formula
  desc "AWS Role Assumption Tool"
  homepage "https://github.com/privoit/awsroletool"
  version "1.0.0"
  url "https://github.com/privoit/awsroletool/releases/download/v1.0.0/AWS.Role.Tool-1.0.0-arm64.dmg"
  sha256 "19461526f140a11e80cebd619ead41a5ca57a09ddb072d51799d9c6a7cacb02a"

  def install
    dmg_path = cached_download

    # Mount the DMG
    system "hdiutil", "attach", dmg_path
    sleep 2  # Give macOS time to mount the volume

    # Detect the correct volume name
    volume_name = Dir.glob("/Volumes/AWS Role Tool*").first
    raise "❌ Volume not found!" unless volume_name

    # Copy the app to Homebrew prefix
    cp_r "#{volume_name}/AWS Role Tool.app", prefix

    # Unmount the DMG safely
    system "hdiutil", "detach", volume_name
  end

  def caveats
    <<~EOS
      ✅ AWS Role Tool has been installed!
      Open it from **Applications** or run:
        open #{opt_prefix}/AWS\ Role\ Tool.app
    EOS
  end
end
