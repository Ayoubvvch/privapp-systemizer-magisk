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

# Set permissions
chmod 0755 "$MODDIR/system/bin/privappctl" 2>/dev/null || true
chown 0:0 "$MODDIR/system/bin/privappctl" 2>/dev/null || true

# Create convenience symlink: systemize -> privappctl
ln -sf privappctl "$MODDIR/system/bin/systemize" 2>/dev/null || true

# Set base permissions for system directories
set_perm_recursive "$MODDIR/system/bin" 0 0 0755 0755
set_perm_recursive "$MODDIR/system/priv-app" 0 0 0755 0644
set_perm_recursive "$MODDIR/system/app" 0 0 0755 0644

ui_print "- PrivApp Systemizer installed successfully!"
ui_print ""
ui_print "  Usage after reboot:"
ui_print "  Open terminal/SSH as root and type: privappctl"
ui_print "  or simply: systemize"
ui_print ""
