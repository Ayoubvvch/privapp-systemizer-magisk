#!/system/bin/sh
# PrivApp Systemizer - Installer Script

ui_print ""
ui_print "****************************************"
ui_print "*       PrivApp Systemizer Modern      *"
ui_print "*          by Ayoubvvch                *"
ui_print "****************************************"
ui_print ""

MODDIR="$MODPATH"
OLD_MODDIR="/data/adb/modules/privapp_systemizer"

# Create required directories
mkdir -p "$MODDIR/system/bin"
mkdir -p "$MODDIR/system/priv-app"
mkdir -p "$MODDIR/system/app"

# Preserve existing systemized apps on upgrade
if [ -d "$OLD_MODDIR/system/priv-app" ]; then
  ui_print "- Preserving existing priv-app apps..."
  cp -af "$OLD_MODDIR/system/priv-app/." "$MODDIR/system/priv-app/" 2>/dev/null || true
fi

if [ -d "$OLD_MODDIR/system/app" ]; then
  ui_print "- Preserving existing system apps..."
  cp -af "$OLD_MODDIR/system/app/." "$MODDIR/system/app/" 2>/dev/null || true
fi

# Set permissions on CLI binaries
chmod 0755 "$MODDIR/system/bin/privappctl" 2>/dev/null || true
chown 0:0 "$MODDIR/system/bin/privappctl" 2>/dev/null || true

# Create convenience symlink: systemize -> privappctl
ln -sf privappctl "$MODDIR/system/bin/systemize" 2>/dev/null || true

# Set permissions for WebUI
if [ -d "$MODDIR/webroot" ]; then
  ui_print "- Configuring KsuWebUI interface..."
  set_perm_recursive "$MODDIR/webroot" 0 0 0755 0644
fi

if [ -f "$MODDIR/icon.png" ]; then
  chmod 0644 "$MODDIR/icon.png" 2>/dev/null || true
fi

# Set base permissions for system directories
set_perm_recursive "$MODDIR/system/bin" 0 0 0755 0755
set_perm_recursive "$MODDIR/system/priv-app" 0 0 0755 0644
set_perm_recursive "$MODDIR/system/app" 0 0 0755 0644

ui_print "- PrivApp Systemizer installed successfully!"
ui_print ""
ui_print "  How to use:"
ui_print "  1) WebUI: Open 'KsuWebUI' app to launch interactive GUI"
ui_print "  2) CLI: In terminal/SSH as root, run: privappctl or systemize"
ui_print ""
