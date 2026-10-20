#!/system/bin/sh
# PrivApp Systemizer - Early Boot Permissions & SELinux Setup

MODDIR="${0%/*}"

# Enforce system permissions and SELinux contexts on systemized directories
if [ -d "$MODDIR/system/priv-app" ]; then
  find "$MODDIR/system/priv-app" -type d -exec chmod 0755 {} + 2>/dev/null
  find "$MODDIR/system/priv-app" -type f -exec chmod 0644 {} + 2>/dev/null
  chown -R 0:0 "$MODDIR/system/priv-app" 2>/dev/null
  chcon -R u:object_r:system_file:s0 "$MODDIR/system/priv-app" 2>/dev/null
fi

if [ -d "$MODDIR/system/app" ]; then
  find "$MODDIR/system/app" -type d -exec chmod 0755 {} + 2>/dev/null
  find "$MODDIR/system/app" -type f -exec chmod 0644 {} + 2>/dev/null
  chown -R 0:0 "$MODDIR/system/app" 2>/dev/null
  chcon -R u:object_r:system_file:s0 "$MODDIR/system/app" 2>/dev/null
fi

if [ -f "$MODDIR/system/bin/privappctl" ]; then
  chmod 0755 "$MODDIR/system/bin/privappctl" 2>/dev/null
  chown 0:0 "$MODDIR/system/bin/privappctl" 2>/dev/null
  chcon u:object_r:system_file:s0 "$MODDIR/system/bin/privappctl" 2>/dev/null
fi
