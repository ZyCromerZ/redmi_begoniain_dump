#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:3bb751e997f783877ab68a0d976ffec950fb3f59; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:dc7d2b39d4a26d776adc81954dfc6751314e785f \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:3bb751e997f783877ab68a0d976ffec950fb3f59 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
