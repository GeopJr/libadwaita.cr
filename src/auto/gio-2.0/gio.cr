# Dependencies
require "../g_object-2.0/g_object.cr"

# C lib declaration
require "./lib_gio.cr"

# Wrappers
require "./action.cr"
require "./action_entry.cr"
require "./action_group.cr"
require "./action_map.cr"
require "./app_info.cr"
require "./app_info_monitor.cr"
require "./app_launch_context.cr"
require "./application.cr"
require "./application_command_line.cr"
require "./async_initable.cr"
require "./async_result.cr"
require "./buffered_input_stream.cr"
require "./buffered_output_stream.cr"
require "./bytes_icon.cr"
require "./cancellable.cr"
require "./charset_converter.cr"
require "./converter.cr"
require "./converter_input_stream.cr"
require "./converter_output_stream.cr"
require "./credentials.cr"
require "./d_bus_action_group.cr"
require "./d_bus_annotation_info.cr"
require "./d_bus_arg_info.cr"
require "./d_bus_auth_observer.cr"
require "./d_bus_connection.cr"
require "./d_bus_error_entry.cr"
require "./d_bus_interface.cr"
require "./d_bus_interface_info.cr"
require "./d_bus_interface_skeleton.cr"
require "./d_bus_interface_v_table.cr"
require "./d_bus_menu_model.cr"
require "./d_bus_message.cr"
require "./d_bus_method_info.cr"
require "./d_bus_method_invocation.cr"
require "./d_bus_node_info.cr"
require "./d_bus_object.cr"
require "./d_bus_object_manager.cr"
require "./d_bus_object_manager_client.cr"
require "./d_bus_object_manager_server.cr"
require "./d_bus_object_proxy.cr"
require "./d_bus_object_skeleton.cr"
require "./d_bus_property_info.cr"
require "./d_bus_proxy.cr"
require "./d_bus_server.cr"
require "./d_bus_signal_info.cr"
require "./d_bus_subtree_v_table.cr"
require "./data_input_stream.cr"
require "./data_output_stream.cr"
require "./datagram_based.cr"
require "./debug_controller.cr"
require "./debug_controller_d_bus.cr"
require "./desktop_app_info.cr"
require "./desktop_app_info_lookup.cr"
require "./drive.cr"
require "./dtls_client_connection.cr"
require "./dtls_connection.cr"
require "./dtls_server_connection.cr"
require "./emblem.cr"
require "./emblemed_icon.cr"
require "./file.cr"
require "./file_attribute_info.cr"
require "./file_attribute_info_list.cr"
require "./file_attribute_matcher.cr"
require "./file_descriptor_based.cr"
require "./file_enumerator.cr"
require "./file_icon.cr"
require "./file_info.cr"
require "./file_input_stream.cr"
require "./file_io_stream.cr"
require "./file_monitor.cr"
require "./file_output_stream.cr"
require "./filename_completer.cr"
require "./filter_input_stream.cr"
require "./filter_output_stream.cr"
require "./icon.cr"
require "./inet_address.cr"
require "./inet_address_mask.cr"
require "./inet_socket_address.cr"
require "./initable.cr"
require "./input_message.cr"
require "./input_stream.cr"
require "./input_vector.cr"
require "./io_extension.cr"
require "./io_extension_point.cr"
require "./io_module.cr"
require "./io_module_scope.cr"
require "./io_scheduler_job.cr"
require "./io_stream.cr"
require "./io_stream_adapter.cr"
require "./list_model.cr"
require "./list_store.cr"
require "./loadable_icon.cr"
require "./memory_input_stream.cr"
require "./memory_monitor.cr"
require "./memory_output_stream.cr"
require "./menu.cr"
require "./menu_attribute_iter.cr"
require "./menu_item.cr"
require "./menu_link_iter.cr"
require "./menu_model.cr"
require "./mount.cr"
require "./mount_operation.cr"
require "./native_socket_address.cr"
require "./native_volume_monitor.cr"
require "./network_address.cr"
require "./network_monitor.cr"
require "./network_service.cr"
require "./notification.cr"
require "./output_message.cr"
require "./output_stream.cr"
require "./output_vector.cr"
require "./permission.cr"
require "./pollable_input_stream.cr"
require "./pollable_output_stream.cr"
require "./power_profile_monitor.cr"
require "./property_action.cr"
require "./proxy.cr"
require "./proxy_address.cr"
require "./proxy_address_enumerator.cr"
require "./proxy_resolver.cr"
require "./remote_action_group.cr"
require "./resolver.cr"
require "./resource.cr"
require "./seekable.cr"
require "./settings.cr"
require "./settings_backend.cr"
require "./settings_schema.cr"
require "./settings_schema_key.cr"
require "./settings_schema_source.cr"
require "./simple_action.cr"
require "./simple_action_group.cr"
require "./simple_async_result.cr"
require "./simple_io_stream.cr"
require "./simple_permission.cr"
require "./simple_proxy_resolver.cr"
require "./socket.cr"
require "./socket_address.cr"
require "./socket_address_enumerator.cr"
require "./socket_client.cr"
require "./socket_connectable.cr"
require "./socket_connection.cr"
require "./socket_control_message.cr"
require "./socket_listener.cr"
require "./socket_service.cr"
require "./srv_target.cr"
require "./subprocess.cr"
require "./subprocess_launcher.cr"
require "./task.cr"
require "./tcp_connection.cr"
require "./tcp_wrapper_connection.cr"
require "./test_d_bus.cr"
require "./themed_icon.cr"
require "./threaded_socket_service.cr"
require "./tls_backend.cr"
require "./tls_certificate.cr"
require "./tls_client_connection.cr"
require "./tls_connection.cr"
require "./tls_database.cr"
require "./tls_file_database.cr"
require "./tls_interaction.cr"
require "./tls_password.cr"
require "./tls_server_connection.cr"
require "./unix_connection.cr"
require "./unix_credentials_message.cr"
require "./unix_fd_list.cr"
require "./unix_fd_message.cr"
require "./unix_input_stream.cr"
require "./unix_mount_entry.cr"
require "./unix_mount_monitor.cr"
require "./unix_mount_point.cr"
require "./unix_output_stream.cr"
require "./unix_socket_address.cr"
require "./vfs.cr"
require "./volume.cr"
require "./volume_monitor.cr"
require "./zlib_compressor.cr"
require "./zlib_decompressor.cr"

module Gio
  # The value returned by handlers of the signals generated by
  # the `gdbus-codegen` tool to indicate that a method call has been
  # handled by an implementation. It is equal to %TRUE, but using
  # this macro is sometimes more readable.
  #
  # In code that needs to be backwards-compatible with older GLib,
  # use %TRUE instead, often written like this:
  #
  # |[
  #   g_dbus_method_invocation_return_error (invocation, ...);
  #   return TRUE;    // handled
  # ]|
  DBUS_METHOD_INVOCATION_HANDLED = true
  # The value returned by handlers of the signals generated by
  # the `gdbus-codegen` tool to indicate that a method call has not been
  # handled by an implementation. It is equal to %FALSE, but using
  # this macro is sometimes more readable.
  #
  # In code that needs to be backwards-compatible with older GLib,
  # use %FALSE instead.
  DBUS_METHOD_INVOCATION_UNHANDLED = true
  # Extension point for debug control functionality.
  # See [Extending GIO][extending-gio].
  DEBUG_CONTROLLER_EXTENSION_POINT_NAME = "gio-debug-controller"
  # Extension point for default handler to URI association. See
  # [Extending GIO][extending-gio].
  DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME = "gio-desktop-app-info-lookup"
  # The string used to obtain a Unix device path with g_drive_get_identifier().
  DRIVE_IDENTIFIER_KIND_UNIX_DEVICE = "unix-device"
  # A key in the "access" namespace for checking deletion privileges.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  #
  # This attribute will be %TRUE if the user is able to delete the file.
  FILE_ATTRIBUTE_ACCESS_CAN_DELETE = "access::can-delete"
  # A key in the "access" namespace for getting execution privileges.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  #
  # This attribute will be %TRUE if the user is able to execute the file.
  FILE_ATTRIBUTE_ACCESS_CAN_EXECUTE = "access::can-execute"
  # A key in the "access" namespace for getting read privileges.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  #
  # This attribute will be %TRUE if the user is able to read the file.
  FILE_ATTRIBUTE_ACCESS_CAN_READ = "access::can-read"
  # A key in the "access" namespace for checking renaming privileges.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  #
  # This attribute will be %TRUE if the user is able to rename the file.
  FILE_ATTRIBUTE_ACCESS_CAN_RENAME = "access::can-rename"
  # A key in the "access" namespace for checking trashing privileges.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  #
  # This attribute will be %TRUE if the user is able to move the file to
  # the trash.
  FILE_ATTRIBUTE_ACCESS_CAN_TRASH = "access::can-trash"
  # A key in the "access" namespace for getting write privileges.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  #
  # This attribute will be %TRUE if the user is able to write to the file.
  FILE_ATTRIBUTE_ACCESS_CAN_WRITE = "access::can-write"
  # A key in the "dos" namespace for checking if the file's archive flag
  # is set.
  #
  # This attribute is %TRUE if the archive flag is set.
  #
  # This attribute is only available for DOS file systems.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_DOS_IS_ARCHIVE = "dos::is-archive"
  # A key in the "dos" namespace for checking if the file is a NTFS mount point
  # (a volume mount or a junction point).
  #
  # This attribute is %TRUE if file is a reparse point of type
  # [IO_REPARSE_TAG_MOUNT_POINT](https://msdn.microsoft.com/en-us/library/dd541667.aspx).
  #
  # This attribute is only available for DOS file systems.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_DOS_IS_MOUNTPOINT = "dos::is-mountpoint"
  # A key in the "dos" namespace for checking if the file's backup flag
  # is set.
  #
  # This attribute is %TRUE if the backup flag is set.
  #
  # This attribute is only available for DOS file systems.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_DOS_IS_SYSTEM = "dos::is-system"
  # A key in the "dos" namespace for getting the file NTFS reparse tag.
  #
  # This value is 0 for files that are not reparse points.
  #
  # See the [Reparse Tags](https://msdn.microsoft.com/en-us/library/dd541667.aspx)
  # page for possible reparse tag values.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_DOS_REPARSE_POINT_TAG = "dos::reparse-point-tag"
  # A key in the "etag" namespace for getting the value of the file's
  # entity tag.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_ETAG_VALUE = "etag::value"
  # A key in the "filesystem" namespace for getting the number of bytes
  # of free space left on the file system.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64.
  FILE_ATTRIBUTE_FILESYSTEM_FREE = "filesystem::free"
  # A key in the "filesystem" namespace for checking if the file system
  # is read only.
  #
  # Is set to %TRUE if the file system is read only.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_FILESYSTEM_READONLY = "filesystem::readonly"
  # A key in the "filesystem" namespace for checking if the file system
  # is remote.
  #
  # Is set to %TRUE if the file system is remote.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_FILESYSTEM_REMOTE = "filesystem::remote"
  # A key in the "filesystem" namespace for getting the total size (in
  # bytes) of the file system, used in g_file_query_filesystem_info().
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64.
  FILE_ATTRIBUTE_FILESYSTEM_SIZE = "filesystem::size"
  # A key in the "filesystem" namespace for getting the file system's type.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_FILESYSTEM_TYPE = "filesystem::type"
  # A key in the "filesystem" namespace for getting the number of bytes
  # used by data on the file system.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64.
  FILE_ATTRIBUTE_FILESYSTEM_USED = "filesystem::used"
  # A key in the "filesystem" namespace for hinting a file manager
  # application whether it should preview (e.g. thumbnail) files on the
  # file system.
  #
  # The value for this key contain a #GFilesystemPreviewType.
  FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW = "filesystem::use-preview"
  # A key in the "gvfs" namespace that gets the name of the current
  # GVFS backend in use.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_GVFS_BACKEND = "gvfs::backend"
  # A key in the "id" namespace for getting a file identifier.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  #
  # An example use would be during listing files, to avoid recursive
  # directory scanning.
  FILE_ATTRIBUTE_ID_FILE = "id::file"
  # A key in the "id" namespace for getting the file system identifier.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  #
  # An example use would be during drag and drop to see if the source
  # and target are on the same filesystem (default to move) or not (default
  # to copy).
  FILE_ATTRIBUTE_ID_FILESYSTEM = "id::filesystem"
  # A key in the "mountable" namespace for checking if a file (of
  # type G_FILE_TYPE_MOUNTABLE) can be ejected.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_MOUNTABLE_CAN_EJECT = "mountable::can-eject"
  # A key in the "mountable" namespace for checking if a file (of
  # type G_FILE_TYPE_MOUNTABLE) is mountable.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_MOUNTABLE_CAN_MOUNT = "mountable::can-mount"
  # A key in the "mountable" namespace for checking if a file (of
  # type G_FILE_TYPE_MOUNTABLE) can be polled.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_MOUNTABLE_CAN_POLL = "mountable::can-poll"
  # A key in the "mountable" namespace for checking if a file (of
  # type G_FILE_TYPE_MOUNTABLE) can be started.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_MOUNTABLE_CAN_START = "mountable::can-start"
  # A key in the "mountable" namespace for checking if a file (of
  # type G_FILE_TYPE_MOUNTABLE) can be started degraded.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_MOUNTABLE_CAN_START_DEGRADED = "mountable::can-start-degraded"
  # A key in the "mountable" namespace for checking if a file (of
  # type G_FILE_TYPE_MOUNTABLE) can be stopped.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_MOUNTABLE_CAN_STOP = "mountable::can-stop"
  # A key in the "mountable" namespace for checking if a file (of
  # type G_FILE_TYPE_MOUNTABLE)  is unmountable.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_MOUNTABLE_CAN_UNMOUNT = "mountable::can-unmount"
  # A key in the "mountable" namespace for getting the HAL UDI for the mountable
  # file.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_MOUNTABLE_HAL_UDI = "mountable::hal-udi"
  # A key in the "mountable" namespace for checking if a file (of
  # type G_FILE_TYPE_MOUNTABLE) is automatically polled for media.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_MOUNTABLE_IS_MEDIA_CHECK_AUTOMATIC = "mountable::is-media-check-automatic"
  # A key in the "mountable" namespace for getting the #GDriveStartStopType.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_MOUNTABLE_START_STOP_TYPE = "mountable::start-stop-type"
  # A key in the "mountable" namespace for getting the unix device.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE = "mountable::unix-device"
  # A key in the "mountable" namespace for getting the unix device file.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE_FILE = "mountable::unix-device-file"
  # A key in the "owner" namespace for getting the file owner's group.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_OWNER_GROUP = "owner::group"
  # A key in the "owner" namespace for getting the user name of the
  # file's owner.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_OWNER_USER = "owner::user"
  # A key in the "owner" namespace for getting the real name of the
  # user that owns the file.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_OWNER_USER_REAL = "owner::user-real"
  # A key in the "preview" namespace for getting a #GIcon that can be
  # used to get preview of the file.
  #
  # For example, it may be a low resolution thumbnail without metadata.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_OBJECT.
  #
  # The value for this key should contain a #GIcon.
  FILE_ATTRIBUTE_PREVIEW_ICON = "preview::icon"
  # A key in the "recent" namespace for getting time, when the metadata for the
  # file in `recent:///` was last changed.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_INT64.
  FILE_ATTRIBUTE_RECENT_MODIFIED = "recent::modified"
  # A key in the "selinux" namespace for getting the file's SELinux
  # context.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  #
  # Note that this attribute is only available if GLib has been built
  # with SELinux support.
  FILE_ATTRIBUTE_SELINUX_CONTEXT = "selinux::context"
  # A key in the "standard" namespace for getting the amount of disk space
  # that is consumed by the file (in bytes).
  #
  # This will generally be larger than the file size (due to block size
  # overhead) but can occasionally be smaller (for example, for sparse files).
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64.
  FILE_ATTRIBUTE_STANDARD_ALLOCATED_SIZE = "standard::allocated-size"
  # A key in the "standard" namespace for getting the content type of the file.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  #
  # The value for this key should contain a valid content type.
  FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE = "standard::content-type"
  # A key in the "standard" namespace for getting the copy name of the file.
  #
  # The copy name is an optional version of the name. If available it's always
  # in UTF8, and corresponds directly to the original filename (only transcoded to
  # UTF8). This is useful if you want to copy the file to another filesystem that
  # might have a different encoding. If the filename is not a valid string in the
  # encoding selected for the filesystem it is in then the copy name will not be set.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_STANDARD_COPY_NAME = "standard::copy-name"
  # A key in the "standard" namespace for getting the description of the file.
  #
  # The description is a utf8 string that describes the file, generally containing
  # the filename, but can also contain further information. Example descriptions
  # could be "filename (on hostname)" for a remote file or "filename (in trash)"
  # for a file in the trash. This is useful for instance as the window title
  # when displaying a directory or for a bookmarks menu.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_STANDARD_DESCRIPTION = "standard::description"
  # A key in the "standard" namespace for getting the display name of the file.
  #
  # A display name is guaranteed to be in UTF-8 and can thus be displayed in
  # the UI. It is guaranteed to be set on every file.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME = "standard::display-name"
  # A key in the "standard" namespace for edit name of the file.
  #
  # An edit name is similar to the display name, but it is meant to be
  # used when you want to rename the file in the UI. The display name
  # might contain information you don't want in the new filename (such as
  # "(invalid unicode)" if the filename was in an invalid encoding).
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_STANDARD_EDIT_NAME = "standard::edit-name"
  # A key in the "standard" namespace for getting the fast content type.
  #
  # The fast content type isn't as reliable as the regular one, as it
  # only uses the filename to guess it, but it is faster to calculate than the
  # regular content type.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_STANDARD_FAST_CONTENT_TYPE = "standard::fast-content-type"
  # A key in the "standard" namespace for getting the icon for the file.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_OBJECT.
  #
  # The value for this key should contain a #GIcon.
  FILE_ATTRIBUTE_STANDARD_ICON = "standard::icon"
  # A key in the "standard" namespace for checking if a file is a backup file.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_STANDARD_IS_BACKUP = "standard::is-backup"
  # A key in the "standard" namespace for checking if a file is hidden.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_STANDARD_IS_HIDDEN = "standard::is-hidden"
  # A key in the "standard" namespace for checking if the file is a symlink.
  # Typically the actual type is something else, if we followed the symlink
  # to get the type.
  #
  # On Windows NTFS mountpoints are considered to be symlinks as well.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_STANDARD_IS_SYMLINK = "standard::is-symlink"
  # A key in the "standard" namespace for checking if a file is virtual.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_STANDARD_IS_VIRTUAL = "standard::is-virtual"
  # A key in the "standard" namespace for checking if a file is
  # volatile. This is meant for opaque, non-POSIX-like backends to
  # indicate that the URI is not persistent. Applications should look
  # at %G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET for the persistent URI.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_STANDARD_IS_VOLATILE = "standard::is-volatile"
  # A key in the "standard" namespace for getting the name of the file.
  #
  # The name is the on-disk filename which may not be in any known encoding,
  # and can thus not be generally displayed as is. It is guaranteed to be set on
  # every file.
  #
  # Use %G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME if you need to display the
  # name in a user interface.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING.
  FILE_ATTRIBUTE_STANDARD_NAME = "standard::name"
  # A key in the "standard" namespace for getting the file's size (in bytes).
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64.
  FILE_ATTRIBUTE_STANDARD_SIZE = "standard::size"
  # A key in the "standard" namespace for setting the sort order of a file.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_INT32.
  #
  # An example use would be in file managers, which would use this key
  # to set the order files are displayed. Files with smaller sort order
  # should be sorted first, and files without sort order as if sort order
  # was zero.
  FILE_ATTRIBUTE_STANDARD_SORT_ORDER = "standard::sort-order"
  # A key in the "standard" namespace for getting the symbolic icon for the file.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_OBJECT.
  #
  # The value for this key should contain a #GIcon.
  FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON = "standard::symbolic-icon"
  # A key in the "standard" namespace for getting the symlink target, if the file
  # is a symlink.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING.
  FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET = "standard::symlink-target"
  # A key in the "standard" namespace for getting the target URI for the file, in
  # the case of %G_FILE_TYPE_SHORTCUT or %G_FILE_TYPE_MOUNTABLE files.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_STANDARD_TARGET_URI = "standard::target-uri"
  # A key in the "standard" namespace for storing file types.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  #
  # The value for this key should contain a #GFileType.
  FILE_ATTRIBUTE_STANDARD_TYPE = "standard::type"
  # A key in the "thumbnail" namespace for checking if thumbnailing failed.
  #
  # This attribute is %TRUE if thumbnailing failed.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_THUMBNAILING_FAILED = "thumbnail::failed"
  # A key in the "thumbnail" namespace for checking whether the thumbnail is outdated.
  #
  # This attribute is %TRUE if the thumbnail is up-to-date with the file it represents,
  # and %FALSE if the file has been modified since the thumbnail was generated.
  #
  # If %G_FILE_ATTRIBUTE_THUMBNAILING_FAILED is %TRUE and this attribute is %FALSE,
  # it indicates that thumbnailing may be attempted again and may succeed.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_THUMBNAIL_IS_VALID = "thumbnail::is-valid"
  # A key in the "thumbnail" namespace for getting the path to the thumbnail
  # image.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING.
  FILE_ATTRIBUTE_THUMBNAIL_PATH = "thumbnail::path"
  # A key in the "time" namespace for getting the time the file was last
  # accessed.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64, and
  # contains the time since the file was last accessed, in seconds since the
  # UNIX epoch.
  FILE_ATTRIBUTE_TIME_ACCESS = "time::access"
  # A key in the "time" namespace for getting the microseconds of the time
  # the file was last accessed.
  #
  # This should be used in conjunction with %G_FILE_ATTRIBUTE_TIME_ACCESS.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_TIME_ACCESS_USEC = "time::access-usec"
  # A key in the "time" namespace for getting the time the file was last
  # changed.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64,
  # and contains the time since the file was last changed, in seconds since
  # the UNIX epoch.
  #
  # This corresponds to the traditional UNIX ctime.
  FILE_ATTRIBUTE_TIME_CHANGED = "time::changed"
  # A key in the "time" namespace for getting the microseconds of the time
  # the file was last changed.
  #
  # This should be used in conjunction with %G_FILE_ATTRIBUTE_TIME_CHANGED.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_TIME_CHANGED_USEC = "time::changed-usec"
  # A key in the "time" namespace for getting the time the file was created.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64,
  # and contains the time since the file was created, in seconds since the UNIX
  # epoch.
  #
  # This may correspond to Linux `stx_btime`, FreeBSD `st_birthtim`, NetBSD
  # `st_birthtime` or NTFS `ctime`.
  FILE_ATTRIBUTE_TIME_CREATED = "time::created"
  # A key in the "time" namespace for getting the microseconds of the time
  # the file was created.
  #
  # This should be used in conjunction with %G_FILE_ATTRIBUTE_TIME_CREATED.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_TIME_CREATED_USEC = "time::created-usec"
  # A key in the "time" namespace for getting the time the file was last
  # modified.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64, and
  # contains the time since the file was modified, in seconds since the UNIX
  # epoch.
  FILE_ATTRIBUTE_TIME_MODIFIED = "time::modified"
  # A key in the "time" namespace for getting the microseconds of the time
  # the file was last modified.
  #
  # This should be used in conjunction with %G_FILE_ATTRIBUTE_TIME_MODIFIED.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_TIME_MODIFIED_USEC = "time::modified-usec"
  # A key in the "trash" namespace for getting the deletion date and time
  # of a file inside the `trash:///` folder.
  #
  # The format of the returned string is `YYYY-MM-DDThh:mm:ss`.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
  FILE_ATTRIBUTE_TRASH_DELETION_DATE = "trash::deletion-date"
  # A key in the "trash" namespace for getting the number of (toplevel) items
  # that are present in the `trash:///` folder.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_TRASH_ITEM_COUNT = "trash::item-count"
  # A key in the "trash" namespace for getting the original path of a file
  # inside the `trash:///` folder before it was trashed.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING.
  FILE_ATTRIBUTE_TRASH_ORIG_PATH = "trash::orig-path"
  # A key in the "unix" namespace for getting the number of blocks allocated
  # for the file.
  #
  # This attribute is only available for UNIX file systems.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64.
  FILE_ATTRIBUTE_UNIX_BLOCKS = "unix::blocks"
  # A key in the "unix" namespace for getting the block size for the file
  # system.
  #
  # This attribute is only available for UNIX file systems.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_UNIX_BLOCK_SIZE = "unix::block-size"
  # A key in the "unix" namespace for getting the device id of the device the
  # file is located on (see stat() documentation).
  #
  # This attribute is only available for UNIX file systems.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_UNIX_DEVICE = "unix::device"
  # A key in the "unix" namespace for getting the group ID for the file.
  #
  # This attribute is only available for UNIX file systems.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_UNIX_GID = "unix::gid"
  # A key in the "unix" namespace for getting the inode of the file.
  #
  # This attribute is only available for UNIX file systems.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64.
  FILE_ATTRIBUTE_UNIX_INODE = "unix::inode"
  # A key in the "unix" namespace for checking if the file represents a
  # UNIX mount point.
  #
  # This attribute is %TRUE if the file is a UNIX mount point.
  #
  # Since 2.58, `/` is considered to be a mount point.
  #
  # This attribute is only available for UNIX file systems.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
  FILE_ATTRIBUTE_UNIX_IS_MOUNTPOINT = "unix::is-mountpoint"
  # A key in the "unix" namespace for getting the mode of the file
  # (e.g. whether the file is a regular file, symlink, etc).
  #
  # See the documentation for `lstat()`: this attribute is equivalent to
  # the `st_mode` member of `struct stat`, and includes both the file type
  # and permissions.
  #
  # This attribute is only available for UNIX file systems.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_UNIX_MODE = "unix::mode"
  # A key in the "unix" namespace for getting the number of hard links
  # for a file.
  #
  # See the documentation for `lstat()`.
  #
  # This attribute is only available for UNIX file systems.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_UNIX_NLINK = "unix::nlink"
  # A key in the "unix" namespace for getting the device ID for the file
  # (if it is a special file).
  #
  # See the documentation for `lstat()`.
  #
  # This attribute is only available for UNIX file systems.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_UNIX_RDEV = "unix::rdev"
  # A key in the "unix" namespace for getting the user ID for the file.
  #
  # This attribute is only available for UNIX file systems.
  #
  # Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
  FILE_ATTRIBUTE_UNIX_UID = "unix::uid"
  # Extension point for memory usage monitoring functionality.
  # See [Extending GIO][extending-gio].
  MEMORY_MONITOR_EXTENSION_POINT_NAME = "gio-memory-monitor"
  # The menu item attribute which holds the action name of the item.  Action
  # names are namespaced with an identifier for the action group in which the
  # action resides. For example, "win." for window-specific actions and "app."
  # for application-wide actions.
  #
  # See also g_menu_model_get_item_attribute() and g_menu_item_set_attribute().
  MENU_ATTRIBUTE_ACTION = "action"
  # The menu item attribute that holds the namespace for all action names in
  # menus that are linked from this item.
  MENU_ATTRIBUTE_ACTION_NAMESPACE = "action-namespace"
  # The menu item attribute which holds the icon of the item.
  #
  # The icon is stored in the format returned by g_icon_serialize().
  #
  # This attribute is intended only to represent 'noun' icons such as
  # favicons for a webpage, or application icons.  It should not be used
  # for 'verbs' (ie: stock icons).
  MENU_ATTRIBUTE_ICON = "icon"
  # The menu item attribute which holds the label of the item.
  MENU_ATTRIBUTE_LABEL = "label"
  # The menu item attribute which holds the target with which the item's action
  # will be activated.
  #
  # See also g_menu_item_set_action_and_target()
  MENU_ATTRIBUTE_TARGET = "target"
  # The name of the link that associates a menu item with a section.  The linked
  # menu will usually be shown in place of the menu item, using the item's label
  # as a header.
  #
  # See also g_menu_item_set_link().
  MENU_LINK_SECTION = "section"
  # The name of the link that associates a menu item with a submenu.
  #
  # See also g_menu_item_set_link().
  MENU_LINK_SUBMENU                          = "submenu"
  NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME = "gio-native-volume-monitor"
  # Extension point for network status monitoring functionality.
  # See [Extending GIO][extending-gio].
  NETWORK_MONITOR_EXTENSION_POINT_NAME = "gio-network-monitor"
  # Extension point for power profile usage monitoring functionality.
  # See [Extending GIO][extending-gio].
  POWER_PROFILE_MONITOR_EXTENSION_POINT_NAME = "gio-power-profile-monitor"
  # Extension point for proxy functionality.
  # See [Extending GIO][extending-gio].
  PROXY_EXTENSION_POINT_NAME = "gio-proxy"
  # Extension point for proxy resolving functionality.
  # See [Extending GIO][extending-gio].
  PROXY_RESOLVER_EXTENSION_POINT_NAME = "gio-proxy-resolver"
  # Extension point for #GSettingsBackend functionality.
  SETTINGS_BACKEND_EXTENSION_POINT_NAME = "gsettings-backend"
  # Extension point for TLS functionality via #GTlsBackend.
  # See [Extending GIO][extending-gio].
  TLS_BACKEND_EXTENSION_POINT_NAME = "gio-tls-backend"
  # The purpose used to verify the client certificate in a TLS connection.
  # Used by TLS servers.
  TLS_DATABASE_PURPOSE_AUTHENTICATE_CLIENT = "1.3.6.1.5.5.7.3.2"
  # The purpose used to verify the server certificate in a TLS connection. This
  # is the most common purpose in use. Used by TLS clients.
  TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER = "1.3.6.1.5.5.7.3.1"
  # Extension point for #GVfs functionality.
  # See [Extending GIO][extending-gio].
  VFS_EXTENSION_POINT_NAME = "gio-vfs"
  # The string used to obtain the volume class with g_volume_get_identifier().
  #
  # Known volume classes include `device`, `network`, and `loop`. Other
  # classes may be added in the future.
  #
  # This is intended to be used by applications to classify #GVolume
  # instances into different sections - for example a file manager or
  # file chooser can use this information to show `network` volumes under
  # a "Network" heading and `device` volumes under a "Devices" heading.
  VOLUME_IDENTIFIER_KIND_CLASS = "class"
  # The string used to obtain a Hal UDI with g_volume_get_identifier().
  VOLUME_IDENTIFIER_KIND_HAL_UDI = "hal-udi"
  # The string used to obtain a filesystem label with g_volume_get_identifier().
  VOLUME_IDENTIFIER_KIND_LABEL = "label"
  # The string used to obtain a NFS mount with g_volume_get_identifier().
  VOLUME_IDENTIFIER_KIND_NFS_MOUNT = "nfs-mount"
  # The string used to obtain a Unix device path with g_volume_get_identifier().
  VOLUME_IDENTIFIER_KIND_UNIX_DEVICE = "unix-device"
  # The string used to obtain a UUID with g_volume_get_identifier().
  VOLUME_IDENTIFIER_KIND_UUID = "uuid"
  # Extension point for volume monitor functionality.
  # See [Extending GIO][extending-gio].
  VOLUME_MONITOR_EXTENSION_POINT_NAME = "gio-volume-monitor"

  # Callbacks

  # Type definition for a function that will be called back when an asynchronous
  # operation within GIO has been completed. #GAsyncReadyCallback
  # callbacks from #GTask are guaranteed to be invoked in a later
  # iteration of the
  # [thread-default main context][g-main-context-push-thread-default]
  # where the #GTask was created. All other users of
  # #GAsyncReadyCallback must likewise call it asynchronously in a
  # later iteration of the main context.
  #
  # The asynchronous operation is guaranteed to have held a reference to
  # @source_object from the time when the `*_async()` function was called, until
  # after this callback returns.
  alias AsyncReadyCallback = Proc(GObject::Object?, Gio::AsyncResult, Nil)

  # Invoked when a connection to a message bus has been obtained.
  alias BusAcquiredCallback = Proc(Gio::DBusConnection, ::String, Nil)

  # Invoked when the name is acquired.
  alias BusNameAcquiredCallback = Proc(Gio::DBusConnection, ::String, Nil)

  # Invoked when the name being watched is known to have to have an owner.
  alias BusNameAppearedCallback = Proc(Gio::DBusConnection, ::String, ::String, Nil)

  # Invoked when the name is lost or @connection has been closed.
  alias BusNameLostCallback = Proc(Gio::DBusConnection, ::String, Nil)

  # Invoked when the name being watched is known not to have to have an owner.
  #
  # This is also invoked when the #GDBusConnection on which the watch was
  # established has been closed.  In that case, @connection will be
  # %NULL.
  alias BusNameVanishedCallback = Proc(Gio::DBusConnection, ::String, Nil)

  # This is the function type of the callback used for the #GSource
  # returned by g_cancellable_source_new().
  alias CancellableSourceFunc = Proc(Gio::Cancellable?, Bool)

  # The type of the @get_property function in #GDBusInterfaceVTable.
  alias DBusInterfaceGetPropertyFunc = Proc(Gio::DBusConnection, ::String, ::String, ::String, ::String, GLib::Error, GLib::Variant)

  # The type of the @method_call function in #GDBusInterfaceVTable.
  alias DBusInterfaceMethodCallFunc = Proc(Gio::DBusConnection, ::String, ::String, ::String, ::String, GLib::Variant, Gio::DBusMethodInvocation, Nil)

  # The type of the @set_property function in #GDBusInterfaceVTable.
  alias DBusInterfaceSetPropertyFunc = Proc(Gio::DBusConnection, ::String, ::String, ::String, ::String, GLib::Variant, GLib::Error, Bool)

  # Signature for function used in g_dbus_connection_add_filter().
  #
  # A filter function is passed a #GDBusMessage and expected to return
  # a #GDBusMessage too. Passive filter functions that don't modify the
  # message can simply return the @message object:
  # |[
  # static GDBusMessage *
  # passive_filter (GDBusConnection *connection
  #                 GDBusMessage    *message,
  #                 gboolean         incoming,
  #                 gpointer         user_data)
  # {
  #   // inspect @message
  #   return message;
  # }
  # ]|
  # Filter functions that wants to drop a message can simply return %NULL:
  # |[
  # static GDBusMessage *
  # drop_filter (GDBusConnection *connection
  #              GDBusMessage    *message,
  #              gboolean         incoming,
  #              gpointer         user_data)
  # {
  #   if (should_drop_message)
  #     {
  #       g_object_unref (message);
  #       message = NULL;
  #     }
  #   return message;
  # }
  # ]|
  # Finally, a filter function may modify a message by copying it:
  # |[
  # static GDBusMessage *
  # modifying_filter (GDBusConnection *connection
  #                   GDBusMessage    *message,
  #                   gboolean         incoming,
  #                   gpointer         user_data)
  # {
  #   GDBusMessage *copy;
  #   GError *error;
  #
  #   error = NULL;
  #   copy = g_dbus_message_copy (message, &error);
  #   // handle @error being set
  #   g_object_unref (message);
  #
  #   // modify @copy
  #
  #   return copy;
  # }
  # ]|
  # If the returned #GDBusMessage is different from @message and cannot
  # be sent on @connection (it could use features, such as file
  # descriptors, not compatible with @connection), then a warning is
  # logged to standard error. Applications can
  # check this ahead of time using g_dbus_message_to_blob() passing a
  # #GDBusCapabilityFlags value obtained from @connection.
  alias DBusMessageFilterFunction = Proc(Gio::DBusConnection, Gio::DBusMessage, Bool, Gio::DBusMessage)

  # Function signature for a function used to determine the #GType to
  # use for an interface proxy (if @interface_name is not %NULL) or
  # object proxy (if @interface_name is %NULL).
  #
  # This function is called in the
  # [thread-default main loop][g-main-context-push-thread-default]
  # that @manager was constructed in.
  alias DBusProxyTypeFunc = Proc(Gio::DBusObjectManagerClient, ::String, ::String?, UInt64)

  # Signature for callback function used in g_dbus_connection_signal_subscribe().
  alias DBusSignalCallback = Proc(Gio::DBusConnection, ::String?, ::String, ::String, ::String, GLib::Variant, Nil)

  # The type of the @dispatch function in #GDBusSubtreeVTable.
  #
  # Subtrees are flat.  @node, if non-%NULL, is always exactly one
  # segment of the object path (ie: it never contains a slash).
  alias DBusSubtreeDispatchFunc = Proc(Gio::DBusConnection, ::String, ::String, ::String, ::String, Pointer(Void), Gio::DBusInterfaceVTable)

  # The type of the @enumerate function in #GDBusSubtreeVTable.
  #
  # This function is called when generating introspection data and also
  # when preparing to dispatch incoming messages in the event that the
  # %G_DBUS_SUBTREE_FLAGS_DISPATCH_TO_UNENUMERATED_NODES flag is not
  # specified (ie: to verify that the object path is valid).
  #
  # Hierarchies are not supported; the items that you return should not
  # contain the `/` character.
  #
  # The return value will be freed with g_strfreev().
  alias DBusSubtreeEnumerateFunc = Proc(Gio::DBusConnection, ::String, ::String, Enumerable(::String))

  # The type of the @introspect function in #GDBusSubtreeVTable.
  #
  # Subtrees are flat.  @node, if non-%NULL, is always exactly one
  # segment of the object path (ie: it never contains a slash).
  #
  # This function should return %NULL to indicate that there is no object
  # at this node.
  #
  # If this function returns non-%NULL, the return value is expected to
  # be a %NULL-terminated array of pointers to #GDBusInterfaceInfo
  # structures describing the interfaces implemented by @node.  This
  # array will have g_dbus_interface_info_unref() called on each item
  # before being freed with g_free().
  #
  # The difference between returning %NULL and an array containing zero
  # items is that the standard DBus interfaces will returned to the
  # remote introspector in the empty array case, but not in the %NULL
  # case.
  alias DBusSubtreeIntrospectFunc = Proc(Gio::DBusConnection, ::String, ::String, ::String, Enumerable(Gio::DBusInterfaceInfo))

  # This is the function type of the callback used for the #GSource
  # returned by g_datagram_based_create_source().
  alias DatagramBasedSourceFunc = Proc(Gio::DatagramBased, GLib::IOCondition, Bool)

  # During invocation, g_desktop_app_info_launch_uris_as_manager() may
  # create one or more child processes.  This callback is invoked once
  # for each, providing the process ID.
  alias DesktopAppLaunchCallback = Proc(Gio::DesktopAppInfo, Int32, Nil)

  # This callback type is used by g_file_measure_disk_usage() to make
  # periodic progress reports when measuring the amount of disk spaced
  # used by a directory.
  #
  # These calls are made on a best-effort basis and not all types of
  # #GFile will support them.  At the minimum, however, one call will
  # always be made immediately.
  #
  # In the case that there is no support, @reporting will be set to
  # %FALSE (and the other values undefined) and no further calls will be
  # made.  Otherwise, the @reporting will be %TRUE and the other values
  # all-zeros during the first (immediate) call.  In this way, you can
  # know which type of progress UI to show without a delay.
  #
  # For g_file_measure_disk_usage() the callback is made directly.  For
  # g_file_measure_disk_usage_async() the callback is made via the
  # default main context of the calling thread (ie: the same way that the
  # final async result would be reported).
  #
  # @current_size is in the same units as requested by the operation (see
  # %G_FILE_MEASURE_APPARENT_SIZE).
  #
  # The frequency of the updates is implementation defined, but is
  # ideally about once every 200ms.
  #
  # The last progress callback may or may not be equal to the final
  # result.  Always check the async result to get the final value.
  alias FileMeasureProgressCallback = Proc(Bool, UInt64, UInt64, UInt64, Nil)

  # When doing file operations that may take a while, such as moving
  # a file or copying a file, a progress callback is used to pass how
  # far along that operation is to the application.
  alias FileProgressCallback = Proc(Int64, Int64, Nil)

  # When loading the partial contents of a file with g_file_load_partial_contents_async(),
  # it may become necessary to determine if any more data from the file should be loaded.
  # A #GFileReadMoreCallback function facilitates this by returning %TRUE if more data
  # should be read, or %FALSE otherwise.
  alias FileReadMoreCallback = Proc(::String, Int64, Bool)

  # I/O Job function.
  #
  # Long-running jobs should periodically check the @cancellable
  # to see if they have been cancelled.
  alias IOSchedulerJobFunc = Proc(Gio::IOSchedulerJob, Gio::Cancellable?, Bool)

  # This is the function type of the callback used for the #GSource
  # returned by g_pollable_input_stream_create_source() and
  # g_pollable_output_stream_create_source().
  alias PollableSourceFunc = Proc(GObject::Object, Bool)

  # Changes the size of the memory block pointed to by @data to
  # @size bytes.
  #
  # The function should have the same semantics as realloc().
  alias ReallocFunc = Proc(Pointer(Void)?, Pointer(Void))

  # The type for the function that is used to convert from #GSettings to
  # an object property. The @value is already initialized to hold values
  # of the appropriate type.
  alias SettingsBindGetMapping = Proc(GObject::Value, GLib::Variant, Bool)

  # The type for the function that is used to convert an object property
  # value to a #GVariant for storing it in #GSettings.
  alias SettingsBindSetMapping = Proc(GObject::Value, GLib::VariantType, GLib::Variant)

  # The type of the function that is used to convert from a value stored
  # in a #GSettings to a value that is useful to the application.
  #
  # If the value is successfully mapped, the result should be stored at
  # @result and %TRUE returned.  If mapping fails (for example, if @value
  # is not in the right format) then %FALSE should be returned.
  #
  # If @value is %NULL then it means that the mapping function is being
  # given a "last chance" to successfully return a valid value.  %TRUE
  # must be returned in this case.
  alias SettingsGetMapping = Proc(GLib::Variant, Pointer(Void)?, Bool)

  # Simple thread function that runs an asynchronous operation and
  # checks for cancellation.
  alias SimpleAsyncThreadFunc = Proc(Gio::SimpleAsyncResult, GObject::Object, Nil)

  # This is the function type of the callback used for the #GSource
  # returned by g_socket_create_source().
  alias SocketSourceFunc = Proc(Gio::Socket, GLib::IOCondition, Bool)

  # The prototype for a task function to be run in a thread via
  # g_task_run_in_thread() or g_task_run_in_thread_sync().
  #
  # If the return-on-cancel flag is set on @task, and @cancellable gets
  # cancelled, then the #GTask will be completed immediately (as though
  # g_task_return_error_if_cancelled() had been called), without
  # waiting for the task function to complete. However, the task
  # function will continue running in its thread in the background. The
  # function therefore needs to be careful about how it uses
  # externally-visible state in this case. See
  # g_task_set_return_on_cancel() for more details.
  #
  # Other than in that case, @task will be completed when the
  # #GTaskThreadFunc returns, not when it calls a
  # `g_task_return_` function.
  alias TaskThreadFunc = Proc(Gio::Task, GObject::Object, Pointer(Void)?, Nil)

  # This function type is used by g_vfs_register_uri_scheme() to make it
  # possible for a client to associate an URI scheme to a different #GFile
  # implementation.
  #
  # The client should return a reference to the new file that has been
  # created for @uri, or %NULL to continue with the default implementation.
  alias VfsFileLookupFunc = Proc(Gio::Vfs, ::String, Gio::File)

  # Base class for all errors in this module.
  class GioError < RuntimeError
    # :nodoc:
    def initialize(error : Pointer(LibGLib::Error))
      message_ptr = error.value.message
      super(String.new(message_ptr)) unless message_ptr.null?
      LibGLib.g_error_free(error)
    end

    # :inherit:
    def initialize(message : String)
      super
    end
  end

  # Enums

  # An enumeration for well-known message buses.
  enum BusType : Int32
    # An alias for the message bus that activated the process, if any.
    Starter = -1
    # Not a message bus.
    None = 0
    # The system-wide message bus.
    System = 1
    # The login session message bus.
    Session = 2
  end

  # Results returned from g_converter_convert().
  enum ConverterResult : UInt32
    # There was an error during conversion.
    Error = 0
    # Some data was consumed or produced
    Converted = 1
    # The conversion is finished
    Finished = 2
    # Flushing is finished
    Flushed = 3
  end

  # Enumeration describing different kinds of native credential types.
  enum CredentialsType : UInt32
    # Indicates an invalid native credential type.
    Invalid = 0
    # The native credentials type is a `struct ucred`.
    LinuxUcred = 1
    # The native credentials type is a `struct cmsgcred`.
    FreebsdCmsgcred = 2
    # The native credentials type is a `struct sockpeercred`. Added in 2.30.
    OpenbsdSockpeercred = 3
    # The native credentials type is a `ucred_t`. Added in 2.40.
    SolarisUcred = 4
    # The native credentials type is a `struct unpcbid`. Added in 2.42.
    NetbsdUnpcbid = 5
    # The native credentials type is a `struct xucred`. Added in 2.66.
    AppleXucred = 6
    # The native credentials type is a PID `DWORD`. Added in 2.72.
    Win32Pid = 7
  end

  # Enumeration used to describe the byte order of a D-Bus message.
  enum DBusMessageByteOrder : UInt32
    # The byte order is big endian.
    BigEndian = 66
    # The byte order is little endian.
    LittleEndian = 108
  end

  # Header fields used in #GDBusMessage.
  enum DBusMessageHeaderField : UInt32
    # Not a valid header field.
    Invalid = 0
    # The object path.
    Path = 1
    # The interface name.
    Interface = 2
    # The method or signal name.
    Member = 3
    # The name of the error that occurred.
    ErrorName = 4
    # The serial number the message is a reply to.
    ReplySerial = 5
    # The name the message is intended for.
    Destination = 6
    # Unique name of the sender of the message (filled in by the bus).
    Sender = 7
    # The signature of the message body.
    Signature = 8
    # The number of UNIX file descriptors that accompany the message.
    NumUnixFds = 9
  end

  # Message types used in #GDBusMessage.
  enum DBusMessageType : UInt32
    # Message is of invalid type.
    Invalid = 0
    # Method call.
    MethodCall = 1
    # Method reply.
    MethodReturn = 2
    # Error reply.
    Error = 3
    # Signal emission.
    Signal = 4
  end

  # #GDataStreamByteOrder is used to ensure proper endianness of streaming data sources
  # across various machine architectures.
  enum DataStreamByteOrder : UInt32
    # Selects Big Endian byte order.
    BigEndian = 0
    # Selects Little Endian byte order.
    LittleEndian = 1
    # Selects endianness based on host machine's architecture.
    HostEndian = 2
  end

  # #GDataStreamNewlineType is used when checking for or setting the line endings for a given file.
  enum DataStreamNewlineType : UInt32
    # Selects "LF" line endings, common on most modern UNIX platforms.
    Lf = 0
    # Selects "CR" line endings.
    Cr = 1
    # Selects "CR, LF" line ending, common on Microsoft Windows.
    CrLf = 2
    # Automatically try to handle any line ending type.
    Any = 3
  end

  # Enumeration describing how a drive can be started/stopped.
  enum DriveStartStopType : UInt32
    # Unknown or drive doesn't support
    #    start/stop.
    Unknown = 0
    # The stop method will physically
    #    shut down the drive and e.g. power down the port the drive is
    #    attached to.
    Shutdown = 1
    # The start/stop methods are used
    #    for connecting/disconnect to the drive over the network.
    Network = 2
    # The start/stop methods will
    #    assemble/disassemble a virtual drive from several physical
    #    drives.
    Multidisk = 3
    # The start/stop methods will
    #    unlock/lock the disk (for example using the ATA <quote>SECURITY
    #    UNLOCK DEVICE</quote> command)
    Password = 4
  end

  # GEmblemOrigin is used to add information about the origin of the emblem
  # to #GEmblem.
  enum EmblemOrigin : UInt32
    # Emblem of unknown origin
    Unknown = 0
    # Emblem adds device-specific information
    Device = 1
    # Emblem depicts live metadata, such as "readonly"
    Livemetadata = 2
    # Emblem comes from a user-defined tag, e.g. set by nautilus (in the future)
    Tag = 3
  end

  # Used by g_file_set_attributes_from_info() when setting file attributes.
  enum FileAttributeStatus : UInt32
    # Attribute value is unset (empty).
    Unset = 0
    # Attribute value is set.
    Set = 1
    # Indicates an error in setting the value.
    ErrorSetting = 2
  end

  # The data types for file attributes.
  enum FileAttributeType : UInt32
    # indicates an invalid or uninitialized type.
    Invalid = 0
    # a null terminated UTF8 string.
    String = 1
    # a zero terminated string of non-zero bytes.
    ByteString = 2
    # a boolean value.
    Boolean = 3
    # an unsigned 4-byte/32-bit integer.
    Uint32 = 4
    # a signed 4-byte/32-bit integer.
    Int32 = 5
    # an unsigned 8-byte/64-bit integer.
    Uint64 = 6
    # a signed 8-byte/64-bit integer.
    Int64 = 7
    # a #GObject.
    Object = 8
    # a %NULL terminated char **. Since 2.22
    Stringv = 9
  end

  # Specifies what type of event a monitor event is.
  enum FileMonitorEvent : UInt32
    # a file changed.
    Changed = 0
    # a hint that this was probably the last change in a set of changes.
    ChangesDoneHint = 1
    # a file was deleted.
    Deleted = 2
    # a file was created.
    Created = 3
    # a file attribute was changed.
    AttributeChanged = 4
    # the file location will soon be unmounted.
    PreUnmount = 5
    # the file location was unmounted.
    Unmounted = 6
    # the file was moved -- only sent if the
    #   (deprecated) %G_FILE_MONITOR_SEND_MOVED flag is set
    Moved = 7
    # the file was renamed within the
    #   current directory -- only sent if the %G_FILE_MONITOR_WATCH_MOVES
    #   flag is set.  Since: 2.46.
    Renamed = 8
    # the file was moved into the
    #   monitored directory from another location -- only sent if the
    #   %G_FILE_MONITOR_WATCH_MOVES flag is set.  Since: 2.46.
    MovedIn = 9
    # the file was moved out of the
    #   monitored directory to another location -- only sent if the
    #   %G_FILE_MONITOR_WATCH_MOVES flag is set.  Since: 2.46
    MovedOut = 10
  end

  # Indicates the file's on-disk type.
  #
  # On Windows systems a file will never have %G_FILE_TYPE_SYMBOLIC_LINK type;
  # use #GFileInfo and %G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK to determine
  # whether a file is a symlink or not. This is due to the fact that NTFS does
  # not have a single filesystem object type for symbolic links - it has
  # files that symlink to files, and directories that symlink to directories.
  # #GFileType enumeration cannot precisely represent this important distinction,
  # which is why all Windows symlinks will continue to be reported as
  # %G_FILE_TYPE_REGULAR or %G_FILE_TYPE_DIRECTORY.
  enum FileType : UInt32
    # File's type is unknown.
    Unknown = 0
    # File handle represents a regular file.
    Regular = 1
    # File handle represents a directory.
    Directory = 2
    # File handle represents a symbolic link
    #    (Unix systems).
    SymbolicLink = 3
    # File is a "special" file, such as a socket, fifo,
    #    block device, or character device.
    Special = 4
    # File is a shortcut (Windows systems).
    Shortcut = 5
    # File is a mountable location.
    Mountable = 6
  end

  # Indicates a hint from the file system whether files should be
  # previewed in a file manager. Returned as the value of the key
  # %G_FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW.
  enum FilesystemPreviewType : UInt32
    # Only preview files if user has explicitly requested it.
    IfAlways = 0
    # Preview files if user has requested preview of "local" files.
    IfLocal = 1
    # Never preview files.
    Never = 2
  end

  # Flags for use with g_io_module_scope_new().
  enum IOModuleScopeFlags : UInt32
    # No module scan flags
    None = 0
    # When using this scope to load or
    #     scan modules, automatically block a modules which has the same base
    #     basename as previously loaded module.
    BlockDuplicates = 1
  end

  # Memory availability warning levels.
  #
  # Note that because new values might be added, it is recommended that applications check
  # #GMemoryMonitorWarningLevel as ranges, for example:
  # |[<!-- language="C" -->
  # if (warning_level > G_MEMORY_MONITOR_WARNING_LEVEL_LOW)
  #   drop_caches ();
  # ]|
  enum MemoryMonitorWarningLevel : UInt32
    # Memory on the device is low, processes
    #   should free up unneeded resources (for example, in-memory caches) so they can
    #   be used elsewhere.
    Low = 50
    # Same as @G_MEMORY_MONITOR_WARNING_LEVEL_LOW
    #   but the device has even less free memory, so processes should try harder to free
    #   up unneeded resources. If your process does not need to stay running, it is a
    #   good time for it to quit.
    Medium = 100
    # The system will soon start terminating
    #   processes to reclaim memory, including background processes.
    Critical = 255
  end

  # #GMountOperationResult is returned as a result when a request for
  # information is send by the mounting operation.
  enum MountOperationResult : UInt32
    # The request was fulfilled and the
    #     user specified data is now available
    Handled = 0
    # The user requested the mount operation
    #     to be aborted
    Aborted = 1
    # The request was unhandled (i.e. not
    #     implemented)
    Unhandled = 2
  end

  # The host's network connectivity state, as reported by #GNetworkMonitor.
  enum NetworkConnectivity : UInt32
    # The host is not configured with a
    #   route to the Internet; it may or may not be connected to a local
    #   network.
    Local = 1
    # The host is connected to a network, but
    #   does not appear to be able to reach the full Internet, perhaps
    #   due to upstream network problems.
    Limited = 2
    # The host is behind a captive portal and
    #   cannot reach the full Internet.
    Portal = 3
    # The host is connected to a network, and
    #   appears to be able to reach the full Internet.
    Full = 4
  end

  # Priority levels for #GNotifications.
  enum NotificationPriority : UInt32
    # the default priority, to be used for the
    #   majority of notifications (for example email messages, software updates,
    #   completed download/sync operations)
    Normal = 0
    # for notifications that do not require
    #   immediate attention - typically used for contextual background
    #   information, such as contact birthdays or local weather
    Low = 1
    # for events that require more attention,
    #   usually because responses are time-sensitive (for example chat and SMS
    #   messages or alarms)
    High = 2
    # for urgent notifications, or notifications
    #   that require a response in a short space of time (for example phone calls
    #   or emergency warnings)
    Urgent = 3
  end

  # #GPasswordSave is used to indicate the lifespan of a saved password.
  #
  # #Gvfs stores passwords in the Gnome keyring when this flag allows it
  # to, and later retrieves it again from there.
  enum PasswordSave : UInt32
    # never save a password.
    Never = 0
    # save a password for the session.
    ForSession = 1
    # save a password permanently.
    Permanently = 2
  end

  # Return value for various IO operations that signal errors via the
  # return value and not necessarily via a #GError.
  #
  # This enum exists to be able to return errors to callers without having to
  # allocate a #GError. Allocating #GErrors can be quite expensive for
  # regularly happening errors like %G_IO_ERROR_WOULD_BLOCK.
  #
  # In case of %G_POLLABLE_RETURN_FAILED a #GError should be set for the
  # operation to give details about the error that happened.
  enum PollableReturn : Int32
    # Generic error condition for when an operation fails.
    Failed = 0
    # The operation was successfully finished.
    Ok = 1
    # The operation would block.
    WouldBlock = -27
  end

  # The type of record that g_resolver_lookup_records() or
  # g_resolver_lookup_records_async() should retrieve. The records are returned
  # as lists of #GVariant tuples. Each record type has different values in
  # the variant tuples returned.
  #
  # %G_RESOLVER_RECORD_SRV records are returned as variants with the signature
  # `(qqqs)`, containing a `guint16` with the priority, a `guint16` with the
  # weight, a `guint16` with the port, and a string of the hostname.
  #
  # %G_RESOLVER_RECORD_MX records are returned as variants with the signature
  # `(qs)`, representing a `guint16` with the preference, and a string containing
  # the mail exchanger hostname.
  #
  # %G_RESOLVER_RECORD_TXT records are returned as variants with the signature
  # `(as)`, representing an array of the strings in the text record. Note: Most TXT
  # records only contain a single string, but
  # [RFC 1035](https://tools.ietf.org/html/rfc1035#section-3.3.14) does allow a
  # record to contain multiple strings. The RFC which defines the interpretation
  # of a specific TXT record will likely require concatenation of multiple
  # strings if they are present, as with
  # [RFC 7208](https://tools.ietf.org/html/rfc7208#section-3.3).
  #
  # %G_RESOLVER_RECORD_SOA records are returned as variants with the signature
  # `(ssuuuuu)`, representing a string containing the primary name server, a
  # string containing the administrator, the serial as a `guint32`, the refresh
  # interval as a `guint32`, the retry interval as a `guint32`, the expire timeout
  # as a `guint32`, and the TTL as a `guint32`.
  #
  # %G_RESOLVER_RECORD_NS records are returned as variants with the signature
  # `(s)`, representing a string of the hostname of the name server.
  enum ResolverRecordType : UInt32
    # look up DNS SRV records for a domain
    Srv = 1
    # look up DNS MX records for a domain
    Mx = 2
    # look up DNS TXT records for a name
    Txt = 3
    # look up DNS SOA records for a zone
    Soa = 4
    # look up DNS NS records for a domain
    Ns = 5
  end

  # Describes an event occurring on a #GSocketClient. See the
  # #GSocketClient::event signal for more details.
  #
  # Additional values may be added to this type in the future.
  enum SocketClientEvent : UInt32
    # The client is doing a DNS lookup.
    Resolving = 0
    # The client has completed a DNS lookup.
    Resolved = 1
    # The client is connecting to a remote
    #   host (either a proxy or the destination server).
    Connecting = 2
    # The client has connected to a remote
    #   host.
    Connected = 3
    # The client is negotiating
    #   with a proxy to connect to the destination server.
    ProxyNegotiating = 4
    # The client has negotiated
    #   with the proxy server.
    ProxyNegotiated = 5
    # The client is performing a
    #   TLS handshake.
    TlsHandshaking = 6
    # The client has performed a
    #   TLS handshake.
    TlsHandshaked = 7
    # The client is done with a particular
    #   #GSocketConnectable.
    Complete = 8
  end

  # The protocol family of a #GSocketAddress. (These values are
  # identical to the system defines %AF_INET, %AF_INET6 and %AF_UNIX,
  # if available.)
  enum SocketFamily : UInt32
    # no address family
    Invalid = 0
    # the UNIX domain family
    Unix = 1
    # the IPv4 family
    Ipv4 = 2
    # the IPv6 family
    Ipv6 = 10
  end

  # Describes an event occurring on a #GSocketListener. See the
  # #GSocketListener::event signal for more details.
  #
  # Additional values may be added to this type in the future.
  enum SocketListenerEvent : UInt32
    # The listener is about to bind a socket.
    Binding = 0
    # The listener has bound a socket.
    Bound = 1
    # The listener is about to start
    #    listening on this socket.
    Listening = 2
    # The listener is now listening on
    #   this socket.
    Listened = 3
  end

  # A protocol identifier is specified when creating a #GSocket, which is a
  # family/type specific identifier, where 0 means the default protocol for
  # the particular family/type.
  #
  # This enum contains a set of commonly available and used protocols. You
  # can also pass any other identifiers handled by the platform in order to
  # use protocols not listed here.
  enum SocketProtocol : Int32
    # The protocol type is unknown
    Unknown = -1
    # The default protocol for the family/type
    Default = 0
    # TCP over IP
    Tcp = 6
    # UDP over IP
    Udp = 17
    # SCTP over IP
    Sctp = 132
  end

  # Flags used when creating a #GSocket. Some protocols may not implement
  # all the socket types.
  enum SocketType : UInt32
    # Type unknown or wrong
    Invalid = 0
    # Reliable connection-based byte streams (e.g. TCP).
    Stream = 1
    # Connectionless, unreliable datagram passing.
    #     (e.g. UDP)
    Datagram = 2
    # Reliable connection-based passing of datagrams
    #     of fixed maximum length (e.g. SCTP).
    Seqpacket = 3
  end

  # The client authentication mode for a #GTlsServerConnection.
  enum TlsAuthenticationMode : UInt32
    # client authentication not required
    None = 0
    # client authentication is requested
    Requested = 1
    # client authentication is required
    Required = 2
  end

  # Flags for g_tls_interaction_request_certificate(),
  # g_tls_interaction_request_certificate_async(), and
  # g_tls_interaction_invoke_request_certificate().
  enum TlsCertificateRequestFlags : UInt32
    # No flags
    None = 0
  end

  # The type of TLS channel binding data to retrieve from #GTlsConnection
  # or #GDtlsConnection, as documented by RFC 5929. The
  # [`tls-unique-for-telnet`](https://tools.ietf.org/html/rfc5929#section-5)
  # binding type is not currently implemented.
  enum TlsChannelBindingType : UInt32
    # [`tls-unique`](https://tools.ietf.org/html/rfc5929#section-3) binding
    #    type
    Unique = 0
    # [`tls-server-end-point`](https://tools.ietf.org/html/rfc5929#section-4)
    #    binding type
    ServerEndPoint = 1
  end

  # Flags for g_tls_database_lookup_certificate_for_handle(),
  # g_tls_database_lookup_certificate_issuer(),
  # and g_tls_database_lookup_certificates_issued_by().
  enum TlsDatabaseLookupFlags : UInt32
    # No lookup flags
    None = 0
    # Restrict lookup to certificates that have
    #     a private key.
    Keypair = 1
  end

  # #GTlsInteractionResult is returned by various functions in #GTlsInteraction
  # when finishing an interaction request.
  enum TlsInteractionResult : UInt32
    # The interaction was unhandled (i.e. not
    #     implemented).
    Unhandled = 0
    # The interaction completed, and resulting data
    #     is available.
    Handled = 1
    # The interaction has failed, or was cancelled.
    #     and the operation should be aborted.
    Failed = 2
  end

  # The TLS or DTLS protocol version used by a #GTlsConnection or
  # #GDtlsConnection. The integer values of these versions are sequential
  # to ensure newer known protocol versions compare greater than older
  # known versions. Any known DTLS protocol version will compare greater
  # than any SSL or TLS protocol version. The protocol version may be
  # %G_TLS_PROTOCOL_VERSION_UNKNOWN if the TLS backend supports a newer
  # protocol version that GLib does not yet know about. This means that
  # it's possible for an unknown DTLS protocol version to compare less
  # than the TLS protocol versions.
  enum TlsProtocolVersion : UInt32
    # No protocol version or unknown protocol version
    Unknown = 0
    # SSL 3.0, which is insecure and should not be used
    Ssl30 = 1
    # TLS 1.0, which is insecure and should not be used
    Tls10 = 2
    # TLS 1.1, which is insecure and should not be used
    Tls11 = 3
    # TLS 1.2, defined by [RFC 5246](https://datatracker.ietf.org/doc/html/rfc5246)
    Tls12 = 4
    # TLS 1.3, defined by [RFC 8446](https://datatracker.ietf.org/doc/html/rfc8446)
    Tls13 = 5
    # DTLS 1.0, which is insecure and should not be used
    Dtls10 = 201
    # DTLS 1.2, defined by [RFC 6347](https://datatracker.ietf.org/doc/html/rfc6347)
    Dtls12 = 202
  end

  # When to allow rehandshaking. See
  # g_tls_connection_set_rehandshake_mode().
  enum TlsRehandshakeMode : UInt32
    # Never allow rehandshaking
    Never = 0
    # Allow safe rehandshaking only
    Safely = 1
    # Allow unsafe rehandshaking
    Unsafely = 2
  end

  # The type of name used by a #GUnixSocketAddress.
  # %G_UNIX_SOCKET_ADDRESS_PATH indicates a traditional unix domain
  # socket bound to a filesystem path. %G_UNIX_SOCKET_ADDRESS_ANONYMOUS
  # indicates a socket not bound to any name (eg, a client-side socket,
  # or a socket created with socketpair()).
  #
  # For abstract sockets, there are two incompatible ways of naming
  # them; the man pages suggest using the entire `struct sockaddr_un`
  # as the name, padding the unused parts of the %sun_path field with
  # zeroes; this corresponds to %G_UNIX_SOCKET_ADDRESS_ABSTRACT_PADDED.
  # However, many programs instead just use a portion of %sun_path, and
  # pass an appropriate smaller length to bind() or connect(). This is
  # %G_UNIX_SOCKET_ADDRESS_ABSTRACT.
  enum UnixSocketAddressType : UInt32
    # invalid
    Invalid = 0
    # anonymous
    Anonymous = 1
    # a filesystem path
    Path = 2
    # an abstract name
    Abstract = 3
    # an abstract name, 0-padded
    #   to the full length of a unix socket name
    AbstractPadded = 4
  end

  # Used to select the type of data format to use for #GZlibDecompressor
  # and #GZlibCompressor.
  enum ZlibCompressorFormat : UInt32
    # deflate compression with zlib header
    Zlib = 0
    # gzip file format
    Gzip = 1
    # deflate compression with no header
    Raw = 2
  end

  # Flags
  @[Flags]
  enum AppInfoCreateFlags : UInt32
    NeedsTerminal               = 1
    SupportsUris                = 2
    SupportsStartupNotification = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_app_info_create_flags_get_type
    end
  end
  @[Flags]
  enum ApplicationFlags : UInt32
    FlagsNone          =   0
    IsService          =   1
    IsLauncher         =   2
    HandlesOpen        =   4
    HandlesCommandLine =   8
    SendEnvironment    =  16
    NonUnique          =  32
    CanOverrideAppId   =  64
    AllowReplacement   = 128
    Replace            = 256

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_application_flags_get_type
    end
  end
  @[Flags]
  enum AskPasswordFlags : UInt32
    NeedPassword       =  1
    NeedUsername       =  2
    NeedDomain         =  4
    SavingSupported    =  8
    AnonymousSupported = 16
    Tcrypt             = 32

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_ask_password_flags_get_type
    end
  end
  @[Flags]
  enum BusNameOwnerFlags : UInt32
    AllowReplacement = 1
    Replace          = 2
    DoNotQueue       = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_bus_name_owner_flags_get_type
    end
  end
  @[Flags]
  enum BusNameWatcherFlags : UInt32
    AutoStart = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_bus_name_watcher_flags_get_type
    end
  end
  @[Flags]
  enum ConverterFlags : UInt32
    InputAtEnd = 1
    Flush      = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_converter_flags_get_type
    end
  end
  @[Flags]
  enum DBusCallFlags : UInt32
    NoAutoStart                   = 1
    AllowInteractiveAuthorization = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_call_flags_get_type
    end
  end
  @[Flags]
  enum DBusCapabilityFlags : UInt32
    UnixFdPassing = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_capability_flags_get_type
    end
  end
  @[Flags]
  enum DBusConnectionFlags : UInt32
    AuthenticationClient          =  1
    AuthenticationServer          =  2
    AuthenticationAllowAnonymous  =  4
    MessageBusConnection          =  8
    DelayMessageProcessing        = 16
    AuthenticationRequireSameUser = 32

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_connection_flags_get_type
    end
  end
  @[Flags]
  enum DBusInterfaceSkeletonFlags : UInt32
    HandleMethodInvocationsInThread = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_interface_skeleton_flags_get_type
    end
  end
  @[Flags]
  enum DBusMessageFlags : UInt32
    NoReplyExpected               = 1
    NoAutoStart                   = 2
    AllowInteractiveAuthorization = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_message_flags_get_type
    end
  end
  @[Flags]
  enum DBusObjectManagerClientFlags : UInt32
    DoNotAutoStart = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_object_manager_client_flags_get_type
    end
  end
  @[Flags]
  enum DBusPropertyInfoFlags : UInt32
    Readable = 1
    Writable = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_property_info_flags_get_type
    end
  end
  @[Flags]
  enum DBusProxyFlags : UInt32
    DoNotLoadProperties          =  1
    DoNotConnectSignals          =  2
    DoNotAutoStart               =  4
    GetInvalidatedProperties     =  8
    DoNotAutoStartAtConstruction = 16
    NoMatchRule                  = 32

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_proxy_flags_get_type
    end
  end
  @[Flags]
  enum DBusSendMessageFlags : UInt32
    PreserveSerial = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_send_message_flags_get_type
    end
  end
  @[Flags]
  enum DBusServerFlags : UInt32
    RunInThread                   = 1
    AuthenticationAllowAnonymous  = 2
    AuthenticationRequireSameUser = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_server_flags_get_type
    end
  end
  @[Flags]
  enum DBusSignalFlags : UInt32
    NoMatchRule        = 1
    MatchArg0Namespace = 2
    MatchArg0Path      = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_signal_flags_get_type
    end
  end
  @[Flags]
  enum DBusSubtreeFlags : UInt32
    DispatchToUnenumeratedNodes = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_subtree_flags_get_type
    end
  end
  enum DriveStartFlags : UInt32
    None = 0

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_drive_start_flags_get_type
    end
  end
  @[Flags]
  enum FileAttributeInfoFlags : UInt32
    CopyWithFile  = 1
    CopyWhenMoved = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_attribute_info_flags_get_type
    end
  end
  @[Flags]
  enum FileCopyFlags : UInt32
    Overwrite          =  1
    Backup             =  2
    NofollowSymlinks   =  4
    AllMetadata        =  8
    NoFallbackForMove  = 16
    TargetDefaultPerms = 32

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_copy_flags_get_type
    end
  end
  @[Flags]
  enum FileCreateFlags : UInt32
    Private            = 1
    ReplaceDestination = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_create_flags_get_type
    end
  end
  @[Flags]
  enum FileMeasureFlags : UInt32
    ReportAnyError = 2
    ApparentSize   = 4
    NoXdev         = 8

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_measure_flags_get_type
    end
  end
  @[Flags]
  enum FileMonitorFlags : UInt32
    WatchMounts    = 1
    SendMoved      = 2
    WatchHardLinks = 4
    WatchMoves     = 8

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_monitor_flags_get_type
    end
  end
  @[Flags]
  enum FileQueryInfoFlags : UInt32
    NofollowSymlinks = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_query_info_flags_get_type
    end
  end
  @[Flags]
  enum IOStreamSpliceFlags : UInt32
    CloseStream1 = 1
    CloseStream2 = 2
    WaitForBoth  = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_io_stream_splice_flags_get_type
    end
  end
  enum MountMountFlags : UInt32
    None = 0

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_mount_mount_flags_get_type
    end
  end
  @[Flags]
  enum MountUnmountFlags : UInt32
    Force = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_mount_unmount_flags_get_type
    end
  end
  @[Flags]
  enum OutputStreamSpliceFlags : UInt32
    CloseSource = 1
    CloseTarget = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_output_stream_splice_flags_get_type
    end
  end
  @[Flags]
  enum ResolverNameLookupFlags : UInt32
    Default  = 0
    Ipv4Only = 1
    Ipv6Only = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_resolver_name_lookup_flags_get_type
    end
  end
  @[Flags]
  enum ResourceFlags : UInt32
    Compressed = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_resource_flags_get_type
    end
  end
  enum ResourceLookupFlags : UInt32
    None = 0

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_resource_lookup_flags_get_type
    end
  end
  @[Flags]
  enum SettingsBindFlags : UInt32
    Default       =  0
    Get           =  1
    Set           =  2
    NoSensitivity =  4
    GetNoChanges  =  8
    InvertBoolean = 16

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_settings_bind_flags_get_type
    end
  end
  @[Flags]
  enum SocketMsgFlags : UInt32
    Oob       = 1
    Peek      = 2
    Dontroute = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_msg_flags_get_type
    end
  end
  @[Flags]
  enum SubprocessFlags : UInt32
    StdinPipe          =   1
    StdinInherit       =   2
    StdoutPipe         =   4
    StdoutSilence      =   8
    StderrPipe         =  16
    StderrSilence      =  32
    StderrMerge        =  64
    InheritFds         = 128
    SearchPathFromEnvp = 256

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_subprocess_flags_get_type
    end
  end
  enum TestDBusFlags : UInt32
    None = 0

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_test_dbus_flags_get_type
    end
  end
  @[Flags]
  enum TlsCertificateFlags : UInt32
    UnknownCa    =   1
    BadIdentity  =   2
    NotActivated =   4
    Expired      =   8
    Revoked      =  16
    Insecure     =  32
    GenericError =  64
    ValidateAll  = 127

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tls_certificate_flags_get_type
    end
  end
  enum TlsDatabaseVerifyFlags : UInt32
    None = 0

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tls_database_verify_flags_get_type
    end
  end
  @[Flags]
  enum TlsPasswordFlags : UInt32
    Retry                 =  2
    ManyTries             =  4
    FinalTry              =  8
    Pkcs11User            = 16
    Pkcs11SecurityOfficer = 32
    Pkcs11ContextSpecific = 64

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tls_password_flags_get_type
    end
  end

  def self.action_name_is_valid(action_name : ::String) : Bool
    # g_action_name_is_valid: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_action_name_is_valid(action_name)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def action_parse_detailed_name(detailed_name : ::String, action_name : ::String, target_value : _) : Bool
    # g_action_parse_detailed_name: (Throws)
    # @action_name: (out) (transfer full)
    # @target_value: (out) (transfer full)
    # Returns: (transfer none)

    _error = Pointer(LibGLib::Error).null

    # Generator::HandmadeArgPlan
    target_value = if !target_value.is_a?(GLib::Variant)
                     GLib::Variant.new(target_value).to_unsafe
                   else
                     target_value.to_unsafe
                   end

    # C call
    _retval = LibGio.g_action_parse_detailed_name(detailed_name, action_name, target_value, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.action_print_detailed_name(action_name : ::String, target_value : _?) : ::String
    # g_action_print_detailed_name: (None)
    # @target_value: (nullable)
    # Returns: (transfer full)

    # Generator::HandmadeArgPlan
    target_value = if target_value.nil?
                     Pointer(Void).null
                   elsif !target_value.is_a?(GLib::Variant)
                     GLib::Variant.new(target_value).to_unsafe
                   else
                     target_value.to_unsafe
                   end

    # C call
    _retval = LibGio.g_action_print_detailed_name(action_name, target_value)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def app_info_create_from_commandline(commandline : ::String, application_name : ::String?, flags : Gio::AppInfoCreateFlags) : Gio::AppInfo
    # g_app_info_create_from_commandline: (Throws)
    # @application_name: (nullable)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # Generator::NullableArrayPlan
    application_name = if application_name.nil?
                         Pointer(LibC::Char).null
                       else
                         application_name.to_unsafe
                       end

    # C call
    _retval = LibGio.g_app_info_create_from_commandline(commandline, application_name, flags, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    Gio::AbstractAppInfo.new(_retval, GICrystal::Transfer::Full)
  end

  def self.app_info_get_all : GLib::List
    # g_app_info_get_all: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_app_info_get_all

    # Return value handling

    GLib::List(Gio::AppInfo).new(_retval, GICrystal::Transfer::Full)
  end

  def self.app_info_get_all_for_type(content_type : ::String) : GLib::List
    # g_app_info_get_all_for_type: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_app_info_get_all_for_type(content_type)

    # Return value handling

    GLib::List(Gio::AppInfo).new(_retval, GICrystal::Transfer::Full)
  end

  def self.app_info_get_default_for_type(content_type : ::String, must_support_uris : Bool) : Gio::AppInfo?
    # g_app_info_get_default_for_type: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_app_info_get_default_for_type(content_type, must_support_uris)

    # Return value handling

    Gio::AbstractAppInfo.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
  end

  def self.app_info_get_default_for_uri_scheme(uri_scheme : ::String) : Gio::AppInfo?
    # g_app_info_get_default_for_uri_scheme: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_app_info_get_default_for_uri_scheme(uri_scheme)

    # Return value handling

    Gio::AbstractAppInfo.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
  end

  def self.app_info_get_fallback_for_type(content_type : ::String) : GLib::List
    # g_app_info_get_fallback_for_type: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_app_info_get_fallback_for_type(content_type)

    # Return value handling

    GLib::List(Gio::AppInfo).new(_retval, GICrystal::Transfer::Full)
  end

  def self.app_info_get_recommended_for_type(content_type : ::String) : GLib::List
    # g_app_info_get_recommended_for_type: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_app_info_get_recommended_for_type(content_type)

    # Return value handling

    GLib::List(Gio::AppInfo).new(_retval, GICrystal::Transfer::Full)
  end

  def app_info_launch_default_for_uri(uri : ::String, context : Gio::AppLaunchContext?) : Bool
    # g_app_info_launch_default_for_uri: (Throws)
    # @context: (nullable)
    # Returns: (transfer none)

    _error = Pointer(LibGLib::Error).null

    # Generator::NullableArrayPlan
    context = if context.nil?
                Pointer(Void).null
              else
                context.to_unsafe
              end

    # C call
    _retval = LibGio.g_app_info_launch_default_for_uri(uri, context, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.app_info_launch_default_for_uri_async(uri : ::String, context : Gio::AppLaunchContext?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
    # g_app_info_launch_default_for_uri_async: (None)
    # @context: (nullable)
    # @cancellable: (nullable)
    # @callback: (nullable)
    # @user_data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    context = if context.nil?
                Pointer(Void).null
              else
                context.to_unsafe
              end
    # Generator::NullableArrayPlan
    cancellable = if cancellable.nil?
                    Pointer(Void).null
                  else
                    cancellable.to_unsafe
                  end
    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibGio.g_app_info_launch_default_for_uri_async(uri, context, cancellable, callback, user_data)

    # Return value handling
  end

  def app_info_launch_default_for_uri_finish(result : Gio::AsyncResult) : Bool
    # g_app_info_launch_default_for_uri_finish: (Throws)
    # Returns: (transfer none)

    _error = Pointer(LibGLib::Error).null

    # C call
    _retval = LibGio.g_app_info_launch_default_for_uri_finish(result, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.app_info_reset_type_associations(content_type : ::String) : Nil
    # g_app_info_reset_type_associations: (None)
    # Returns: (transfer none)

    # C call
    LibGio.g_app_info_reset_type_associations(content_type)

    # Return value handling
  end

  def self.async_initable_newv_async(object_type : UInt64, n_parameters : UInt32, parameters : GObject::Parameter, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
    # g_async_initable_newv_async: (None)
    # @cancellable: (nullable)
    # @callback: (nullable)
    # @user_data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    cancellable = if cancellable.nil?
                    Pointer(Void).null
                  else
                    cancellable.to_unsafe
                  end
    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibGio.g_async_initable_newv_async(object_type, n_parameters, parameters, io_priority, cancellable, callback, user_data)

    # Return value handling
  end

  def self.bus_get(bus_type : Gio::BusType, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
    # g_bus_get: (None)
    # @cancellable: (nullable)
    # @callback: (nullable)
    # @user_data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    cancellable = if cancellable.nil?
                    Pointer(Void).null
                  else
                    cancellable.to_unsafe
                  end
    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibGio.g_bus_get(bus_type, cancellable, callback, user_data)

    # Return value handling
  end

  def bus_get_finish(res : Gio::AsyncResult) : Gio::DBusConnection
    # g_bus_get_finish: (Throws)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # C call
    _retval = LibGio.g_bus_get_finish(res, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    Gio::DBusConnection.new(_retval, GICrystal::Transfer::Full)
  end

  def bus_get_sync(bus_type : Gio::BusType, cancellable : Gio::Cancellable?) : Gio::DBusConnection
    # g_bus_get_sync: (Throws)
    # @cancellable: (nullable)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # Generator::NullableArrayPlan
    cancellable = if cancellable.nil?
                    Pointer(Void).null
                  else
                    cancellable.to_unsafe
                  end

    # C call
    _retval = LibGio.g_bus_get_sync(bus_type, cancellable, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    Gio::DBusConnection.new(_retval, GICrystal::Transfer::Full)
  end

  def self.bus_own_name_on_connection(connection : Gio::DBusConnection, name : ::String, flags : Gio::BusNameOwnerFlags, name_acquired_closure : GObject::Closure?, name_lost_closure : GObject::Closure?) : UInt32
    # g_bus_own_name_on_connection_with_closures: (None)
    # @name_acquired_closure: (nullable)
    # @name_lost_closure: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    name_acquired_closure = if name_acquired_closure.nil?
                              Pointer(Void).null
                            else
                              name_acquired_closure.to_unsafe
                            end
    # Generator::NullableArrayPlan
    name_lost_closure = if name_lost_closure.nil?
                          Pointer(Void).null
                        else
                          name_lost_closure.to_unsafe
                        end

    # C call
    _retval = LibGio.g_bus_own_name_on_connection_with_closures(connection, name, flags, name_acquired_closure, name_lost_closure)

    # Return value handling

    _retval
  end

  def self.bus_own_name(bus_type : Gio::BusType, name : ::String, flags : Gio::BusNameOwnerFlags, bus_acquired_closure : GObject::Closure?, name_acquired_closure : GObject::Closure?, name_lost_closure : GObject::Closure?) : UInt32
    # g_bus_own_name_with_closures: (None)
    # @bus_acquired_closure: (nullable)
    # @name_acquired_closure: (nullable)
    # @name_lost_closure: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    bus_acquired_closure = if bus_acquired_closure.nil?
                             Pointer(Void).null
                           else
                             bus_acquired_closure.to_unsafe
                           end
    # Generator::NullableArrayPlan
    name_acquired_closure = if name_acquired_closure.nil?
                              Pointer(Void).null
                            else
                              name_acquired_closure.to_unsafe
                            end
    # Generator::NullableArrayPlan
    name_lost_closure = if name_lost_closure.nil?
                          Pointer(Void).null
                        else
                          name_lost_closure.to_unsafe
                        end

    # C call
    _retval = LibGio.g_bus_own_name_with_closures(bus_type, name, flags, bus_acquired_closure, name_acquired_closure, name_lost_closure)

    # Return value handling

    _retval
  end

  def self.bus_unown_name(owner_id : UInt32) : Nil
    # g_bus_unown_name: (None)
    # Returns: (transfer none)

    # C call
    LibGio.g_bus_unown_name(owner_id)

    # Return value handling
  end

  def self.bus_unwatch_name(watcher_id : UInt32) : Nil
    # g_bus_unwatch_name: (None)
    # Returns: (transfer none)

    # C call
    LibGio.g_bus_unwatch_name(watcher_id)

    # Return value handling
  end

  def self.bus_watch_name_on_connection(connection : Gio::DBusConnection, name : ::String, flags : Gio::BusNameWatcherFlags, name_appeared_closure : GObject::Closure?, name_vanished_closure : GObject::Closure?) : UInt32
    # g_bus_watch_name_on_connection_with_closures: (None)
    # @name_appeared_closure: (nullable)
    # @name_vanished_closure: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    name_appeared_closure = if name_appeared_closure.nil?
                              Pointer(Void).null
                            else
                              name_appeared_closure.to_unsafe
                            end
    # Generator::NullableArrayPlan
    name_vanished_closure = if name_vanished_closure.nil?
                              Pointer(Void).null
                            else
                              name_vanished_closure.to_unsafe
                            end

    # C call
    _retval = LibGio.g_bus_watch_name_on_connection_with_closures(connection, name, flags, name_appeared_closure, name_vanished_closure)

    # Return value handling

    _retval
  end

  def self.bus_watch_name(bus_type : Gio::BusType, name : ::String, flags : Gio::BusNameWatcherFlags, name_appeared_closure : GObject::Closure?, name_vanished_closure : GObject::Closure?) : UInt32
    # g_bus_watch_name_with_closures: (None)
    # @name_appeared_closure: (nullable)
    # @name_vanished_closure: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    name_appeared_closure = if name_appeared_closure.nil?
                              Pointer(Void).null
                            else
                              name_appeared_closure.to_unsafe
                            end
    # Generator::NullableArrayPlan
    name_vanished_closure = if name_vanished_closure.nil?
                              Pointer(Void).null
                            else
                              name_vanished_closure.to_unsafe
                            end

    # C call
    _retval = LibGio.g_bus_watch_name_with_closures(bus_type, name, flags, name_appeared_closure, name_vanished_closure)

    # Return value handling

    _retval
  end

  def self.content_type_can_be_executable(type : ::String) : Bool
    # g_content_type_can_be_executable: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_content_type_can_be_executable(type)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.content_type_equals(type1 : ::String, type2 : ::String) : Bool
    # g_content_type_equals: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_content_type_equals(type1, type2)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.content_type_from_mime_type(mime_type : ::String) : ::String?
    # g_content_type_from_mime_type: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_content_type_from_mime_type(mime_type)

    # Return value handling

    GICrystal.transfer_full(_retval) unless _retval.null?
  end

  def self.content_type_get_description(type : ::String) : ::String
    # g_content_type_get_description: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_content_type_get_description(type)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.content_type_get_generic_icon_name(type : ::String) : ::String?
    # g_content_type_get_generic_icon_name: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_content_type_get_generic_icon_name(type)

    # Return value handling

    GICrystal.transfer_full(_retval) unless _retval.null?
  end

  def self.content_type_get_icon(type : ::String) : Gio::Icon
    # g_content_type_get_icon: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_content_type_get_icon(type)

    # Return value handling

    Gio::AbstractIcon.new(_retval, GICrystal::Transfer::Full)
  end

  def self.content_type_get_mime_dirs : Enumerable(::String)
    # g_content_type_get_mime_dirs: (None)
    # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

    # C call
    _retval = LibGio.g_content_type_get_mime_dirs

    # Return value handling

    GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
  end

  def self.content_type_get_mime_type(type : ::String) : ::String?
    # g_content_type_get_mime_type: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_content_type_get_mime_type(type)

    # Return value handling

    GICrystal.transfer_full(_retval) unless _retval.null?
  end

  def self.content_type_get_symbolic_icon(type : ::String) : Gio::Icon
    # g_content_type_get_symbolic_icon: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_content_type_get_symbolic_icon(type)

    # Return value handling

    Gio::AbstractIcon.new(_retval, GICrystal::Transfer::Full)
  end

  def self.content_type_guess(filename : ::String?, data : Enumerable(UInt8)?) : ::String
    # g_content_type_guess: (None)
    # @filename: (nullable)
    # @data: (nullable) (array length=data_size element-type UInt8)
    # @result_uncertain: (out) (transfer full) (optional)
    # Returns: (transfer full)

    # Generator::NullableArrayPlan
    filename = if filename.nil?
                 Pointer(LibC::Char).null
               else
                 filename.to_unsafe
               end
    # Generator::ArrayLengthArgPlan
    data_size = data.try(&.size) || 0 # Generator::NullableArrayPlan
    data = if data.nil?
             Pointer(UInt8).null
           else
             data.to_a.to_unsafe
           end
    # Generator::OutArgUsedInReturnPlan
    result_uncertain = Pointer(LibC::Int).null
    # C call
    _retval = LibGio.g_content_type_guess(filename, data, data_size, result_uncertain)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.content_type_guess_for_tree(root : Gio::File) : Enumerable(::String)
    # g_content_type_guess_for_tree: (None)
    # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

    # C call
    _retval = LibGio.g_content_type_guess_for_tree(root)

    # Return value handling

    GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
  end

  def self.content_type_is_a(type : ::String, supertype : ::String) : Bool
    # g_content_type_is_a: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_content_type_is_a(type, supertype)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.content_type_is_mime_type(type : ::String, mime_type : ::String) : Bool
    # g_content_type_is_mime_type: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_content_type_is_mime_type(type, mime_type)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.content_type_is_unknown(type : ::String) : Bool
    # g_content_type_is_unknown: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_content_type_is_unknown(type)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.content_type_set_mime_dirs(dirs : Enumerable(::String)?) : Nil
    # g_content_type_set_mime_dirs: (None)
    # @dirs: (nullable) (array zero-terminated=1 element-type Utf8)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    dirs = if dirs.nil?
             Pointer(Pointer(LibC::Char)).null
           else
             dirs.to_a.map(&.to_unsafe).to_unsafe
           end

    # C call
    LibGio.g_content_type_set_mime_dirs(dirs)

    # Return value handling
  end

  def self.content_type_set_mime_dirs(*dirs : ::String)
    self.content_type_set_mime_dirs(dirs)
  end

  def self.content_types_get_registered : GLib::List
    # g_content_types_get_registered: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_content_types_get_registered

    # Return value handling

    GLib::List(::String).new(_retval, GICrystal::Transfer::Full)
  end

  def self.dbus_address_escape_value(string : ::String) : ::String
    # g_dbus_address_escape_value: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_dbus_address_escape_value(string)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def dbus_address_get_for_bus_sync(bus_type : Gio::BusType, cancellable : Gio::Cancellable?) : ::String
    # g_dbus_address_get_for_bus_sync: (Throws)
    # @cancellable: (nullable)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # Generator::NullableArrayPlan
    cancellable = if cancellable.nil?
                    Pointer(Void).null
                  else
                    cancellable.to_unsafe
                  end

    # C call
    _retval = LibGio.g_dbus_address_get_for_bus_sync(bus_type, cancellable, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.dbus_address_get_stream(address : ::String, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
    # g_dbus_address_get_stream: (None)
    # @cancellable: (nullable)
    # @callback: (nullable)
    # @user_data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    cancellable = if cancellable.nil?
                    Pointer(Void).null
                  else
                    cancellable.to_unsafe
                  end
    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibGio.g_dbus_address_get_stream(address, cancellable, callback, user_data)

    # Return value handling
  end

  def dbus_address_get_stream_finish(res : Gio::AsyncResult) : Gio::IOStream
    # g_dbus_address_get_stream_finish: (Throws)
    # @out_guid: (out) (transfer full) (nullable) (optional)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # Generator::OutArgUsedInReturnPlan
    out_guid = Pointer(Pointer(LibC::Char)).null
    # C call
    _retval = LibGio.g_dbus_address_get_stream_finish(res, out_guid, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    Gio::IOStream.new(_retval, GICrystal::Transfer::Full)
  end

  def dbus_address_get_stream_sync(address : ::String, cancellable : Gio::Cancellable?) : Gio::IOStream
    # g_dbus_address_get_stream_sync: (Throws)
    # @out_guid: (out) (transfer full) (nullable) (optional)
    # @cancellable: (nullable)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # Generator::OutArgUsedInReturnPlan
    out_guid = Pointer(Pointer(LibC::Char)).null # Generator::NullableArrayPlan
    cancellable = if cancellable.nil?
                    Pointer(Void).null
                  else
                    cancellable.to_unsafe
                  end

    # C call
    _retval = LibGio.g_dbus_address_get_stream_sync(address, out_guid, cancellable, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    Gio::IOStream.new(_retval, GICrystal::Transfer::Full)
  end

  def self.dbus_annotation_info_lookup(annotations : Enumerable(Gio::DBusAnnotationInfo)?, name : ::String) : ::String?
    # g_dbus_annotation_info_lookup: (None)
    # @annotations: (nullable) (array zero-terminated=1 element-type Interface)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    annotations = if annotations.nil?
                    Pointer(Pointer(Void)).null
                  else
                    annotations.to_a.map(&.to_unsafe).to_unsafe
                  end

    # C call
    _retval = LibGio.g_dbus_annotation_info_lookup(annotations, name)

    # Return value handling

    ::String.new(_retval) unless _retval.null?
  end

  def self.dbus_error_encode_gerror(error : GLib::Error) : ::String
    # g_dbus_error_encode_gerror: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_dbus_error_encode_gerror(error)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.dbus_error_get_remote_error(error : GLib::Error) : ::String?
    # g_dbus_error_get_remote_error: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_dbus_error_get_remote_error(error)

    # Return value handling

    GICrystal.transfer_full(_retval) unless _retval.null?
  end

  def self.dbus_error_is_remote_error(error : GLib::Error) : Bool
    # g_dbus_error_is_remote_error: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_dbus_error_is_remote_error(error)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.dbus_error_new_for_dbus_error(dbus_error_name : ::String, dbus_error_message : ::String) : GLib::Error
    # g_dbus_error_new_for_dbus_error: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_dbus_error_new_for_dbus_error(dbus_error_name, dbus_error_message)

    # Return value handling

    GLib::Error.new(_retval, GICrystal::Transfer::Full)
  end

  def self.dbus_error_quark : UInt32
    # g_dbus_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_dbus_error_quark

    # Return value handling

    _retval
  end

  def self.dbus_error_register_error(error_domain : UInt32, error_code : Int32, dbus_error_name : ::String) : Bool
    # g_dbus_error_register_error: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_dbus_error_register_error(error_domain, error_code, dbus_error_name)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.dbus_error_register_error_domain(error_domain_quark_name : ::String, quark_volatile : Pointer(UInt64), entries : Enumerable(Gio::DBusErrorEntry)) : Nil
    # g_dbus_error_register_error_domain: (None)
    # @entries: (array length=num_entries element-type Interface)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    num_entries = entries.size # Generator::ArrayArgPlan
    entries = entries.to_a.map(&.to_unsafe).to_unsafe

    # C call
    LibGio.g_dbus_error_register_error_domain(error_domain_quark_name, quark_volatile, entries, num_entries)

    # Return value handling
  end

  def self.dbus_error_strip_remote_error(error : GLib::Error) : Bool
    # g_dbus_error_strip_remote_error: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_dbus_error_strip_remote_error(error)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.dbus_error_unregister_error(error_domain : UInt32, error_code : Int32, dbus_error_name : ::String) : Bool
    # g_dbus_error_unregister_error: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_dbus_error_unregister_error(error_domain, error_code, dbus_error_name)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.dbus_escape_object_path(s : ::String) : ::String
    # g_dbus_escape_object_path: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_dbus_escape_object_path(s)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.dbus_escape_object_path_bytestring(bytes : Enumerable(UInt8)) : ::String
    # g_dbus_escape_object_path_bytestring: (None)
    # @bytes: (array zero-terminated=1 element-type UInt8)
    # Returns: (transfer full)

    # Generator::ArrayArgPlan
    bytes = bytes.to_a.to_unsafe

    # C call
    _retval = LibGio.g_dbus_escape_object_path_bytestring(bytes)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.dbus_escape_object_path_bytestring(*bytes : UInt8)
    self.dbus_escape_object_path_bytestring(bytes)
  end

  def self.dbus_generate_guid : ::String
    # g_dbus_generate_guid: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_dbus_generate_guid

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.dbus_gvalue_to_gvariant(gvalue : _, type : GLib::VariantType) : GLib::Variant
    # g_dbus_gvalue_to_gvariant: (None)
    # Returns: (transfer full)

    # Generator::HandmadeArgPlan
    gvalue = if !gvalue.is_a?(GObject::Value)
               GObject::Value.new(gvalue).to_unsafe
             else
               gvalue.to_unsafe
             end

    # C call
    _retval = LibGio.g_dbus_gvalue_to_gvariant(gvalue, type)

    # Return value handling

    GLib::Variant.new(_retval, GICrystal::Transfer::Full)
  end

  def self.dbus_gvariant_to_gvalue(value : _) : GObject::Value
    # g_dbus_gvariant_to_gvalue: (None)
    # @out_gvalue: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::HandmadeArgPlan
    value = if !value.is_a?(GLib::Variant)
              GLib::Variant.new(value).to_unsafe
            else
              value.to_unsafe
            end
    # Generator::CallerAllocatesPlan
    out_gvalue = GObject::Value.new
    # C call
    LibGio.g_dbus_gvariant_to_gvalue(value, out_gvalue)

    # Return value handling

    out_gvalue
  end

  def self.dbus_is_address(string : ::String) : Bool
    # g_dbus_is_address: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_dbus_is_address(string)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.dbus_is_error_name(string : ::String) : Bool
    # g_dbus_is_error_name: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_dbus_is_error_name(string)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.dbus_is_guid(string : ::String) : Bool
    # g_dbus_is_guid: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_dbus_is_guid(string)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.dbus_is_interface_name(string : ::String) : Bool
    # g_dbus_is_interface_name: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_dbus_is_interface_name(string)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.dbus_is_member_name(string : ::String) : Bool
    # g_dbus_is_member_name: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_dbus_is_member_name(string)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.dbus_is_name(string : ::String) : Bool
    # g_dbus_is_name: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_dbus_is_name(string)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def dbus_is_supported_address(string : ::String) : Bool
    # g_dbus_is_supported_address: (Throws)
    # Returns: (transfer none)

    _error = Pointer(LibGLib::Error).null

    # C call
    _retval = LibGio.g_dbus_is_supported_address(string, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.dbus_is_unique_name(string : ::String) : Bool
    # g_dbus_is_unique_name: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_dbus_is_unique_name(string)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.dbus_unescape_object_path(s : ::String) : Enumerable(UInt8)?
    # g_dbus_unescape_object_path: (None)
    # Returns: (transfer none) (array zero-terminated=1 element-type UInt8)

    # C call
    _retval = LibGio.g_dbus_unescape_object_path(s)

    # Return value handling

    GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None) unless _retval.null?
  end

  def dtls_client_connection_new(base_socket : Gio::DatagramBased, server_identity : Gio::SocketConnectable?) : Gio::DtlsClientConnection
    # g_dtls_client_connection_new: (Throws)
    # @server_identity: (nullable)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # Generator::NullableArrayPlan
    server_identity = if server_identity.nil?
                        Pointer(Void).null
                      else
                        server_identity.to_unsafe
                      end

    # C call
    _retval = LibGio.g_dtls_client_connection_new(base_socket, server_identity, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    Gio::AbstractDtlsClientConnection.new(_retval, GICrystal::Transfer::Full)
  end

  def dtls_server_connection_new(base_socket : Gio::DatagramBased, certificate : Gio::TlsCertificate?) : Gio::DtlsServerConnection
    # g_dtls_server_connection_new: (Throws)
    # @certificate: (nullable)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # Generator::NullableArrayPlan
    certificate = if certificate.nil?
                    Pointer(Void).null
                  else
                    certificate.to_unsafe
                  end

    # C call
    _retval = LibGio.g_dtls_server_connection_new(base_socket, certificate, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    Gio::AbstractDtlsServerConnection.new(_retval, GICrystal::Transfer::Full)
  end

  def self.file_new_for_commandline_arg(arg : ::String) : Gio::File
    # g_file_new_for_commandline_arg: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_file_new_for_commandline_arg(arg)

    # Return value handling

    Gio::AbstractFile.new(_retval, GICrystal::Transfer::Full)
  end

  def self.file_new_for_commandline_arg_and_cwd(arg : ::String, cwd : ::String) : Gio::File
    # g_file_new_for_commandline_arg_and_cwd: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_file_new_for_commandline_arg_and_cwd(arg, cwd)

    # Return value handling

    Gio::AbstractFile.new(_retval, GICrystal::Transfer::Full)
  end

  def self.file_new_for_path(path : ::String) : Gio::File
    # g_file_new_for_path: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_file_new_for_path(path)

    # Return value handling

    Gio::AbstractFile.new(_retval, GICrystal::Transfer::Full)
  end

  def self.file_new_for_uri(uri : ::String) : Gio::File
    # g_file_new_for_uri: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_file_new_for_uri(uri)

    # Return value handling

    Gio::AbstractFile.new(_retval, GICrystal::Transfer::Full)
  end

  def file_new_tmp(tmpl : ::String?, iostream : Gio::FileIOStream) : Gio::File
    # g_file_new_tmp: (Throws)
    # @tmpl: (nullable)
    # @iostream: (out) (transfer full)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # Generator::NullableArrayPlan
    tmpl = if tmpl.nil?
             Pointer(LibC::Char).null
           else
             tmpl.to_unsafe
           end
    # Generator::TransferFullArgPlan
    LibGObject.g_object_ref_sink(iostream)
    # C call
    _retval = LibGio.g_file_new_tmp(tmpl, iostream, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    Gio::AbstractFile.new(_retval, GICrystal::Transfer::Full)
  end

  def self.file_parse_name(parse_name : ::String) : Gio::File
    # g_file_parse_name: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_file_parse_name(parse_name)

    # Return value handling

    Gio::AbstractFile.new(_retval, GICrystal::Transfer::Full)
  end

  def self.icon_deserialize(value : _) : Gio::Icon?
    # g_icon_deserialize: (None)
    # Returns: (transfer full)

    # Generator::HandmadeArgPlan
    value = if !value.is_a?(GLib::Variant)
              GLib::Variant.new(value).to_unsafe
            else
              value.to_unsafe
            end

    # C call
    _retval = LibGio.g_icon_deserialize(value)

    # Return value handling

    Gio::AbstractIcon.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
  end

  def self.icon_hash(icon : Pointer(Void)) : UInt32
    # g_icon_hash: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_icon_hash(icon)

    # Return value handling

    _retval
  end

  def icon_new_for_string(str : ::String) : Gio::Icon
    # g_icon_new_for_string: (Throws)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # C call
    _retval = LibGio.g_icon_new_for_string(str, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    Gio::AbstractIcon.new(_retval, GICrystal::Transfer::Full)
  end

  def initable_newv(object_type : UInt64, parameters : Enumerable(GObject::Parameter), cancellable : Gio::Cancellable?) : GObject::Object
    # g_initable_newv: (Throws)
    # @parameters: (array length=n_parameters element-type Interface)
    # @cancellable: (nullable)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # Generator::ArrayLengthArgPlan
    n_parameters = parameters.size # Generator::ArrayArgPlan
    parameters = parameters.to_a.map(&.to_unsafe).to_unsafe
    # Generator::NullableArrayPlan
    cancellable = if cancellable.nil?
                    Pointer(Void).null
                  else
                    cancellable.to_unsafe
                  end

    # C call
    _retval = LibGio.g_initable_newv(object_type, n_parameters, parameters, cancellable, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    GObject::Object.new(_retval, GICrystal::Transfer::Full)
  end

  def self.io_error_from_errno(err_no : Int32) : Gio::IOErrorEnum
    # g_io_error_from_errno: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_io_error_from_errno(err_no)

    # Return value handling

    Gio::IOErrorEnum.new(_retval)
  end

  def self.io_error_quark : UInt32
    # g_io_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_io_error_quark

    # Return value handling

    _retval
  end

  def self.io_extension_point_implement(extension_point_name : ::String, type : UInt64, extension_name : ::String, priority : Int32) : Gio::IOExtension
    # g_io_extension_point_implement: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_io_extension_point_implement(extension_point_name, type, extension_name, priority)

    # Return value handling

    Gio::IOExtension.new(_retval, GICrystal::Transfer::None)
  end

  def self.io_extension_point_lookup(name : ::String) : Gio::IOExtensionPoint
    # g_io_extension_point_lookup: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_io_extension_point_lookup(name)

    # Return value handling

    Gio::IOExtensionPoint.new(_retval, GICrystal::Transfer::None)
  end

  def self.io_extension_point_register(name : ::String) : Gio::IOExtensionPoint
    # g_io_extension_point_register: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_io_extension_point_register(name)

    # Return value handling

    Gio::IOExtensionPoint.new(_retval, GICrystal::Transfer::None)
  end

  def self.io_modules_load_all_in_directory(dirname : ::String) : GLib::List
    # g_io_modules_load_all_in_directory: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_io_modules_load_all_in_directory(dirname)

    # Return value handling

    GLib::List(Gio::IOModule).new(_retval, GICrystal::Transfer::Full)
  end

  def self.io_modules_load_all_in_directory_with_scope(dirname : ::String, scope : Gio::IOModuleScope) : GLib::List
    # g_io_modules_load_all_in_directory_with_scope: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_io_modules_load_all_in_directory_with_scope(dirname, scope)

    # Return value handling

    GLib::List(Gio::IOModule).new(_retval, GICrystal::Transfer::Full)
  end

  def self.io_modules_scan_all_in_directory(dirname : ::String) : Nil
    # g_io_modules_scan_all_in_directory: (None)
    # Returns: (transfer none)

    # C call
    LibGio.g_io_modules_scan_all_in_directory(dirname)

    # Return value handling
  end

  def self.io_modules_scan_all_in_directory_with_scope(dirname : ::String, scope : Gio::IOModuleScope) : Nil
    # g_io_modules_scan_all_in_directory_with_scope: (None)
    # Returns: (transfer none)

    # C call
    LibGio.g_io_modules_scan_all_in_directory_with_scope(dirname, scope)

    # Return value handling
  end

  def self.io_scheduler_cancel_all_jobs : Nil
    # g_io_scheduler_cancel_all_jobs: (None)
    # Returns: (transfer none)

    # C call
    LibGio.g_io_scheduler_cancel_all_jobs

    # Return value handling
  end

  def self.io_scheduler_push_job(job_func : Gio::IOSchedulerJobFunc, user_data : Pointer(Void)?, notify : GLib::DestroyNotify?, io_priority : Int32, cancellable : Gio::Cancellable?) : Nil
    # g_io_scheduler_push_job: (None)
    # @user_data: (nullable)
    # @notify: (nullable)
    # @cancellable: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end
    # Generator::NullableArrayPlan
    cancellable = if cancellable.nil?
                    Pointer(Void).null
                  else
                    cancellable.to_unsafe
                  end

    # C call
    LibGio.g_io_scheduler_push_job(job_func, user_data, notify, io_priority, cancellable)

    # Return value handling
  end

  def self.keyfile_settings_backend_new(filename : ::String, root_path : ::String, root_group : ::String?) : Gio::SettingsBackend
    # g_keyfile_settings_backend_new: (None)
    # @root_group: (nullable)
    # Returns: (transfer full)

    # Generator::NullableArrayPlan
    root_group = if root_group.nil?
                   Pointer(LibC::Char).null
                 else
                   root_group.to_unsafe
                 end

    # C call
    _retval = LibGio.g_keyfile_settings_backend_new(filename, root_path, root_group)

    # Return value handling

    Gio::SettingsBackend.new(_retval, GICrystal::Transfer::Full)
  end

  def self.memory_monitor_dup_default : Gio::MemoryMonitor
    # g_memory_monitor_dup_default: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_memory_monitor_dup_default

    # Return value handling

    Gio::AbstractMemoryMonitor.new(_retval, GICrystal::Transfer::Full)
  end

  def self.memory_settings_backend_new : Gio::SettingsBackend
    # g_memory_settings_backend_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_memory_settings_backend_new

    # Return value handling

    Gio::SettingsBackend.new(_retval, GICrystal::Transfer::Full)
  end

  def self.network_monitor_get_default : Gio::NetworkMonitor
    # g_network_monitor_get_default: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_network_monitor_get_default

    # Return value handling

    Gio::AbstractNetworkMonitor.new(_retval, GICrystal::Transfer::None)
  end

  def self.networking_init : Nil
    # g_networking_init: (None)
    # Returns: (transfer none)

    # C call
    LibGio.g_networking_init

    # Return value handling
  end

  def self.null_settings_backend_new : Gio::SettingsBackend
    # g_null_settings_backend_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_null_settings_backend_new

    # Return value handling

    Gio::SettingsBackend.new(_retval, GICrystal::Transfer::Full)
  end

  def self.pollable_source_new(pollable_stream : GObject::Object) : GLib::Source
    # g_pollable_source_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_pollable_source_new(pollable_stream)

    # Return value handling

    GLib::Source.new(_retval, GICrystal::Transfer::Full)
  end

  def self.pollable_source_new_full(pollable_stream : GObject::Object, child_source : GLib::Source?, cancellable : Gio::Cancellable?) : GLib::Source
    # g_pollable_source_new_full: (None)
    # @child_source: (nullable)
    # @cancellable: (nullable)
    # Returns: (transfer full)

    # Generator::NullableArrayPlan
    child_source = if child_source.nil?
                     Pointer(Void).null
                   else
                     child_source.to_unsafe
                   end
    # Generator::NullableArrayPlan
    cancellable = if cancellable.nil?
                    Pointer(Void).null
                  else
                    cancellable.to_unsafe
                  end

    # C call
    _retval = LibGio.g_pollable_source_new_full(pollable_stream, child_source, cancellable)

    # Return value handling

    GLib::Source.new(_retval, GICrystal::Transfer::Full)
  end

  def pollable_stream_read(stream : Gio::InputStream, buffer : Enumerable(UInt8), blocking : Bool, cancellable : Gio::Cancellable?) : Int64
    # g_pollable_stream_read: (Throws)
    # @buffer: (array length=count element-type UInt8)
    # @cancellable: (nullable)
    # Returns: (transfer none)

    _error = Pointer(LibGLib::Error).null

    # Generator::ArrayLengthArgPlan
    count = buffer.size # Generator::ArrayArgPlan
    buffer = buffer.to_a.to_unsafe
    # Generator::NullableArrayPlan
    cancellable = if cancellable.nil?
                    Pointer(Void).null
                  else
                    cancellable.to_unsafe
                  end

    # C call
    _retval = LibGio.g_pollable_stream_read(stream, buffer, count, blocking, cancellable, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    _retval
  end

  def pollable_stream_write(stream : Gio::OutputStream, buffer : Enumerable(UInt8), blocking : Bool, cancellable : Gio::Cancellable?) : Int64
    # g_pollable_stream_write: (Throws)
    # @buffer: (array length=count element-type UInt8)
    # @cancellable: (nullable)
    # Returns: (transfer none)

    _error = Pointer(LibGLib::Error).null

    # Generator::ArrayLengthArgPlan
    count = buffer.size # Generator::ArrayArgPlan
    buffer = buffer.to_a.to_unsafe
    # Generator::NullableArrayPlan
    cancellable = if cancellable.nil?
                    Pointer(Void).null
                  else
                    cancellable.to_unsafe
                  end

    # C call
    _retval = LibGio.g_pollable_stream_write(stream, buffer, count, blocking, cancellable, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    _retval
  end

  def pollable_stream_write_all(stream : Gio::OutputStream, buffer : Enumerable(UInt8), blocking : Bool, bytes_written : UInt64, cancellable : Gio::Cancellable?) : Bool
    # g_pollable_stream_write_all: (Throws)
    # @buffer: (array length=count element-type UInt8)
    # @bytes_written: (out) (transfer full)
    # @cancellable: (nullable)
    # Returns: (transfer none)

    _error = Pointer(LibGLib::Error).null

    # Generator::ArrayLengthArgPlan
    count = buffer.size # Generator::ArrayArgPlan
    buffer = buffer.to_a.to_unsafe
    # Generator::NullableArrayPlan
    cancellable = if cancellable.nil?
                    Pointer(Void).null
                  else
                    cancellable.to_unsafe
                  end

    # C call
    _retval = LibGio.g_pollable_stream_write_all(stream, buffer, count, blocking, bytes_written, cancellable, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.power_profile_monitor_dup_default : Gio::PowerProfileMonitor
    # g_power_profile_monitor_dup_default: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_power_profile_monitor_dup_default

    # Return value handling

    Gio::AbstractPowerProfileMonitor.new(_retval, GICrystal::Transfer::Full)
  end

  def self.proxy_get_default_for_protocol(protocol : ::String) : Gio::Proxy?
    # g_proxy_get_default_for_protocol: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_proxy_get_default_for_protocol(protocol)

    # Return value handling

    Gio::AbstractProxy.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
  end

  def self.proxy_resolver_get_default : Gio::ProxyResolver
    # g_proxy_resolver_get_default: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_proxy_resolver_get_default

    # Return value handling

    Gio::AbstractProxyResolver.new(_retval, GICrystal::Transfer::None)
  end

  def self.resolver_error_quark : UInt32
    # g_resolver_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_resolver_error_quark

    # Return value handling

    _retval
  end

  def self.resource_error_quark : UInt32
    # g_resource_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_resource_error_quark

    # Return value handling

    _retval
  end

  def resource_load(filename : ::String) : Gio::Resource
    # g_resource_load: (Throws)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # C call
    _retval = LibGio.g_resource_load(filename, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    Gio::Resource.new(_retval, GICrystal::Transfer::Full)
  end

  def resources_enumerate_children(path : ::String, lookup_flags : Gio::ResourceLookupFlags) : Enumerable(::String)
    # g_resources_enumerate_children: (Throws)
    # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

    _error = Pointer(LibGLib::Error).null

    # C call
    _retval = LibGio.g_resources_enumerate_children(path, lookup_flags, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
  end

  def resources_get_info(path : ::String, lookup_flags : Gio::ResourceLookupFlags) : Bool
    # g_resources_get_info: (Throws)
    # @size: (out) (transfer full) (optional)
    # @flags: (out) (transfer full) (optional)
    # Returns: (transfer none)

    _error = Pointer(LibGLib::Error).null

    # Generator::OutArgUsedInReturnPlan
    size = Pointer(UInt64).null # Generator::OutArgUsedInReturnPlan
    flags = Pointer(UInt32).null
    # C call
    _retval = LibGio.g_resources_get_info(path, lookup_flags, size, flags, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def resources_lookup_data(path : ::String, lookup_flags : Gio::ResourceLookupFlags) : GLib::Bytes
    # g_resources_lookup_data: (Throws)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # C call
    _retval = LibGio.g_resources_lookup_data(path, lookup_flags, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
  end

  def resources_open_stream(path : ::String, lookup_flags : Gio::ResourceLookupFlags) : Gio::InputStream
    # g_resources_open_stream: (Throws)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # C call
    _retval = LibGio.g_resources_open_stream(path, lookup_flags, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    Gio::InputStream.new(_retval, GICrystal::Transfer::Full)
  end

  def self.resources_register(resource : Gio::Resource) : Nil
    # g_resources_register: (None)
    # Returns: (transfer none)

    # C call
    LibGio.g_resources_register(resource)

    # Return value handling
  end

  def self.resources_unregister(resource : Gio::Resource) : Nil
    # g_resources_unregister: (None)
    # Returns: (transfer none)

    # C call
    LibGio.g_resources_unregister(resource)

    # Return value handling
  end

  def self.settings_schema_source_get_default : Gio::SettingsSchemaSource?
    # g_settings_schema_source_get_default: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_settings_schema_source_get_default

    # Return value handling

    Gio::SettingsSchemaSource.new(_retval, GICrystal::Transfer::None) unless _retval.null?
  end

  def self.simple_async_report_gerror_in_idle(object : GObject::Object?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?, error : GLib::Error) : Nil
    # g_simple_async_report_gerror_in_idle: (None)
    # @object: (nullable)
    # @callback: (nullable)
    # @user_data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    object = if object.nil?
               Pointer(Void).null
             else
               object.to_unsafe
             end
    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibGio.g_simple_async_report_gerror_in_idle(object, callback, user_data, error)

    # Return value handling
  end

  def self.tls_backend_get_default : Gio::TlsBackend
    # g_tls_backend_get_default: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_tls_backend_get_default

    # Return value handling

    Gio::AbstractTlsBackend.new(_retval, GICrystal::Transfer::None)
  end

  def self.tls_channel_binding_error_quark : UInt32
    # g_tls_channel_binding_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_tls_channel_binding_error_quark

    # Return value handling

    _retval
  end

  def tls_client_connection_new(base_io_stream : Gio::IOStream, server_identity : Gio::SocketConnectable?) : Gio::TlsClientConnection
    # g_tls_client_connection_new: (Throws)
    # @server_identity: (nullable)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # Generator::NullableArrayPlan
    server_identity = if server_identity.nil?
                        Pointer(Void).null
                      else
                        server_identity.to_unsafe
                      end

    # C call
    _retval = LibGio.g_tls_client_connection_new(base_io_stream, server_identity, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    Gio::AbstractTlsClientConnection.new(_retval, GICrystal::Transfer::Full)
  end

  def self.tls_error_quark : UInt32
    # g_tls_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_tls_error_quark

    # Return value handling

    _retval
  end

  def tls_file_database_new(anchors : ::String) : Gio::TlsFileDatabase
    # g_tls_file_database_new: (Throws)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # C call
    _retval = LibGio.g_tls_file_database_new(anchors, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    Gio::AbstractTlsFileDatabase.new(_retval, GICrystal::Transfer::Full)
  end

  def tls_server_connection_new(base_io_stream : Gio::IOStream, certificate : Gio::TlsCertificate?) : Gio::TlsServerConnection
    # g_tls_server_connection_new: (Throws)
    # @certificate: (nullable)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # Generator::NullableArrayPlan
    certificate = if certificate.nil?
                    Pointer(Void).null
                  else
                    certificate.to_unsafe
                  end

    # C call
    _retval = LibGio.g_tls_server_connection_new(base_io_stream, certificate, pointerof(_error))

    # Error check
    Gio.raise_exception(_error) unless _error.null?

    # Return value handling

    Gio::AbstractTlsServerConnection.new(_retval, GICrystal::Transfer::Full)
  end

  def self.unix_is_mount_path_system_internal(mount_path : ::String) : Bool
    # g_unix_is_mount_path_system_internal: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_unix_is_mount_path_system_internal(mount_path)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.unix_is_system_device_path(device_path : ::String) : Bool
    # g_unix_is_system_device_path: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_unix_is_system_device_path(device_path)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.unix_is_system_fs_type(fs_type : ::String) : Bool
    # g_unix_is_system_fs_type: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_unix_is_system_fs_type(fs_type)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.unix_mount_at(mount_path : ::String) : Gio::UnixMountEntry?
    # g_unix_mount_at: (None)
    # @time_read: (out) (transfer full) (optional)
    # Returns: (transfer full)

    # Generator::OutArgUsedInReturnPlan
    time_read = Pointer(UInt64).null
    # C call
    _retval = LibGio.g_unix_mount_at(mount_path, time_read)

    # Return value handling

    Gio::UnixMountEntry.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
  end

  def self.unix_mount_compare(mount1 : Gio::UnixMountEntry, mount2 : Gio::UnixMountEntry) : Int32
    # g_unix_mount_compare: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_unix_mount_compare(mount1, mount2)

    # Return value handling

    _retval
  end

  def self.unix_mount_copy(mount_entry : Gio::UnixMountEntry) : Gio::UnixMountEntry
    # g_unix_mount_copy: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_unix_mount_copy(mount_entry)

    # Return value handling

    Gio::UnixMountEntry.new(_retval, GICrystal::Transfer::Full)
  end

  def self.unix_mount_for(file_path : ::String) : Gio::UnixMountEntry?
    # g_unix_mount_for: (None)
    # @time_read: (out) (transfer full) (optional)
    # Returns: (transfer full)

    # Generator::OutArgUsedInReturnPlan
    time_read = Pointer(UInt64).null
    # C call
    _retval = LibGio.g_unix_mount_for(file_path, time_read)

    # Return value handling

    Gio::UnixMountEntry.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
  end

  def self.unix_mount_free(mount_entry : Gio::UnixMountEntry) : Nil
    # g_unix_mount_free: (None)
    # Returns: (transfer none)

    # C call
    LibGio.g_unix_mount_free(mount_entry)

    # Return value handling
  end

  def self.unix_mount_get_device_path(mount_entry : Gio::UnixMountEntry) : ::Path
    # g_unix_mount_get_device_path: (None)
    # Returns: (transfer none Filename)

    # C call
    _retval = LibGio.g_unix_mount_get_device_path(mount_entry)

    # Return value handling

    ::Path.new(::String.new(_retval))
  end

  def self.unix_mount_get_fs_type(mount_entry : Gio::UnixMountEntry) : ::String
    # g_unix_mount_get_fs_type: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_unix_mount_get_fs_type(mount_entry)

    # Return value handling

    ::String.new(_retval)
  end

  def self.unix_mount_get_mount_path(mount_entry : Gio::UnixMountEntry) : ::Path
    # g_unix_mount_get_mount_path: (None)
    # Returns: (transfer none Filename)

    # C call
    _retval = LibGio.g_unix_mount_get_mount_path(mount_entry)

    # Return value handling

    ::Path.new(::String.new(_retval))
  end

  def self.unix_mount_get_options(mount_entry : Gio::UnixMountEntry) : ::String?
    # g_unix_mount_get_options: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_unix_mount_get_options(mount_entry)

    # Return value handling

    ::String.new(_retval) unless _retval.null?
  end

  def self.unix_mount_get_root_path(mount_entry : Gio::UnixMountEntry) : ::String?
    # g_unix_mount_get_root_path: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_unix_mount_get_root_path(mount_entry)

    # Return value handling

    ::String.new(_retval) unless _retval.null?
  end

  def self.unix_mount_guess_can_eject(mount_entry : Gio::UnixMountEntry) : Bool
    # g_unix_mount_guess_can_eject: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_unix_mount_guess_can_eject(mount_entry)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.unix_mount_guess_icon(mount_entry : Gio::UnixMountEntry) : Gio::Icon
    # g_unix_mount_guess_icon: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_unix_mount_guess_icon(mount_entry)

    # Return value handling

    Gio::AbstractIcon.new(_retval, GICrystal::Transfer::Full)
  end

  def self.unix_mount_guess_name(mount_entry : Gio::UnixMountEntry) : ::String
    # g_unix_mount_guess_name: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_unix_mount_guess_name(mount_entry)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.unix_mount_guess_should_display(mount_entry : Gio::UnixMountEntry) : Bool
    # g_unix_mount_guess_should_display: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_unix_mount_guess_should_display(mount_entry)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.unix_mount_guess_symbolic_icon(mount_entry : Gio::UnixMountEntry) : Gio::Icon
    # g_unix_mount_guess_symbolic_icon: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGio.g_unix_mount_guess_symbolic_icon(mount_entry)

    # Return value handling

    Gio::AbstractIcon.new(_retval, GICrystal::Transfer::Full)
  end

  def self.unix_mount_is_readonly(mount_entry : Gio::UnixMountEntry) : Bool
    # g_unix_mount_is_readonly: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_unix_mount_is_readonly(mount_entry)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.unix_mount_is_system_internal(mount_entry : Gio::UnixMountEntry) : Bool
    # g_unix_mount_is_system_internal: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_unix_mount_is_system_internal(mount_entry)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.unix_mount_point_at(mount_path : ::String) : Gio::UnixMountPoint?
    # g_unix_mount_point_at: (None)
    # @time_read: (out) (transfer full) (optional)
    # Returns: (transfer full)

    # Generator::OutArgUsedInReturnPlan
    time_read = Pointer(UInt64).null
    # C call
    _retval = LibGio.g_unix_mount_point_at(mount_path, time_read)

    # Return value handling

    Gio::UnixMountPoint.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
  end

  def self.unix_mount_points_changed_since(time : UInt64) : Bool
    # g_unix_mount_points_changed_since: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_unix_mount_points_changed_since(time)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.unix_mount_points_get : GLib::List
    # g_unix_mount_points_get: (None)
    # @time_read: (out) (transfer full) (optional)
    # Returns: (transfer full)

    # Generator::OutArgUsedInReturnPlan
    time_read = Pointer(UInt64).null
    # C call
    _retval = LibGio.g_unix_mount_points_get(time_read)

    # Return value handling

    GLib::List(Gio::UnixMountPoint).new(_retval, GICrystal::Transfer::Full)
  end

  def self.unix_mounts_changed_since(time : UInt64) : Bool
    # g_unix_mounts_changed_since: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGio.g_unix_mounts_changed_since(time)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.unix_mounts_get : GLib::List
    # g_unix_mounts_get: (None)
    # @time_read: (out) (transfer full) (optional)
    # Returns: (transfer full)

    # Generator::OutArgUsedInReturnPlan
    time_read = Pointer(UInt64).null
    # C call
    _retval = LibGio.g_unix_mounts_get(time_read)

    # Return value handling

    GLib::List(Gio::UnixMountEntry).new(_retval, GICrystal::Transfer::Full)
  end

  # Errors

  # Error codes for the %G_DBUS_ERROR error domain.
  class DBusError < GioError
    class Failed < DBusError
      def code : Int32
        0
      end
    end

    class NoMemory < DBusError
      def code : Int32
        1
      end
    end

    class ServiceUnknown < DBusError
      def code : Int32
        2
      end
    end

    class NameHasNoOwner < DBusError
      def code : Int32
        3
      end
    end

    class NoReply < DBusError
      def code : Int32
        4
      end
    end

    class IoError < DBusError
      def code : Int32
        5
      end
    end

    class BadAddress < DBusError
      def code : Int32
        6
      end
    end

    class NotSupported < DBusError
      def code : Int32
        7
      end
    end

    class LimitsExceeded < DBusError
      def code : Int32
        8
      end
    end

    class AccessDenied < DBusError
      def code : Int32
        9
      end
    end

    class AuthFailed < DBusError
      def code : Int32
        10
      end
    end

    class NoServer < DBusError
      def code : Int32
        11
      end
    end

    class Timeout < DBusError
      def code : Int32
        12
      end
    end

    class NoNetwork < DBusError
      def code : Int32
        13
      end
    end

    class AddressInUse < DBusError
      def code : Int32
        14
      end
    end

    class Disconnected < DBusError
      def code : Int32
        15
      end
    end

    class InvalidArgs < DBusError
      def code : Int32
        16
      end
    end

    class FileNotFound < DBusError
      def code : Int32
        17
      end
    end

    class FileExists < DBusError
      def code : Int32
        18
      end
    end

    class UnknownMethod < DBusError
      def code : Int32
        19
      end
    end

    class TimedOut < DBusError
      def code : Int32
        20
      end
    end

    class MatchRuleNotFound < DBusError
      def code : Int32
        21
      end
    end

    class MatchRuleInvalid < DBusError
      def code : Int32
        22
      end
    end

    class SpawnExecFailed < DBusError
      def code : Int32
        23
      end
    end

    class SpawnForkFailed < DBusError
      def code : Int32
        24
      end
    end

    class SpawnChildExited < DBusError
      def code : Int32
        25
      end
    end

    class SpawnChildSignaled < DBusError
      def code : Int32
        26
      end
    end

    class SpawnFailed < DBusError
      def code : Int32
        27
      end
    end

    class SpawnSetupFailed < DBusError
      def code : Int32
        28
      end
    end

    class SpawnConfigInvalid < DBusError
      def code : Int32
        29
      end
    end

    class SpawnServiceInvalid < DBusError
      def code : Int32
        30
      end
    end

    class SpawnServiceNotFound < DBusError
      def code : Int32
        31
      end
    end

    class SpawnPermissionsInvalid < DBusError
      def code : Int32
        32
      end
    end

    class SpawnFileInvalid < DBusError
      def code : Int32
        33
      end
    end

    class SpawnNoMemory < DBusError
      def code : Int32
        34
      end
    end

    class UnixProcessIdUnknown < DBusError
      def code : Int32
        35
      end
    end

    class InvalidSignature < DBusError
      def code : Int32
        36
      end
    end

    class InvalidFileContent < DBusError
      def code : Int32
        37
      end
    end

    class SelinuxSecurityContextUnknown < DBusError
      def code : Int32
        38
      end
    end

    class AdtAuditDataUnknown < DBusError
      def code : Int32
        39
      end
    end

    class ObjectPathInUse < DBusError
      def code : Int32
        40
      end
    end

    class UnknownObject < DBusError
      def code : Int32
        41
      end
    end

    class UnknownInterface < DBusError
      def code : Int32
        42
      end
    end

    class UnknownProperty < DBusError
      def code : Int32
        43
      end
    end

    class PropertyReadOnly < DBusError
      def code : Int32
        44
      end
    end
  end

  # Error codes returned by GIO functions.
  #
  # Note that this domain may be extended in future GLib releases. In
  # general, new error codes either only apply to new APIs, or else
  # replace %G_IO_ERROR_FAILED in cases that were not explicitly
  # distinguished before. You should therefore avoid writing code like
  # |[<!-- language="C" -->
  # if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_FAILED))
  #   {
  #     // Assume that this is EPRINTERONFIRE
  #     ...
  #   }
  # ]|
  # but should instead treat all unrecognized error codes the same as
  # %G_IO_ERROR_FAILED.
  #
  # See also #GPollableReturn for a cheaper way of returning
  # %G_IO_ERROR_WOULD_BLOCK to callers without allocating a #GError.
  class IOErrorEnum < GioError
    class Failed < IOErrorEnum
      def code : Int32
        0
      end
    end

    class NotFound < IOErrorEnum
      def code : Int32
        1
      end
    end

    class Exists < IOErrorEnum
      def code : Int32
        2
      end
    end

    class IsDirectory < IOErrorEnum
      def code : Int32
        3
      end
    end

    class NotDirectory < IOErrorEnum
      def code : Int32
        4
      end
    end

    class NotEmpty < IOErrorEnum
      def code : Int32
        5
      end
    end

    class NotRegularFile < IOErrorEnum
      def code : Int32
        6
      end
    end

    class NotSymbolicLink < IOErrorEnum
      def code : Int32
        7
      end
    end

    class NotMountableFile < IOErrorEnum
      def code : Int32
        8
      end
    end

    class FilenameTooLong < IOErrorEnum
      def code : Int32
        9
      end
    end

    class InvalidFilename < IOErrorEnum
      def code : Int32
        10
      end
    end

    class TooManyLinks < IOErrorEnum
      def code : Int32
        11
      end
    end

    class NoSpace < IOErrorEnum
      def code : Int32
        12
      end
    end

    class InvalidArgument < IOErrorEnum
      def code : Int32
        13
      end
    end

    class PermissionDenied < IOErrorEnum
      def code : Int32
        14
      end
    end

    class NotSupported < IOErrorEnum
      def code : Int32
        15
      end
    end

    class NotMounted < IOErrorEnum
      def code : Int32
        16
      end
    end

    class AlreadyMounted < IOErrorEnum
      def code : Int32
        17
      end
    end

    class Closed < IOErrorEnum
      def code : Int32
        18
      end
    end

    class Cancelled < IOErrorEnum
      def code : Int32
        19
      end
    end

    class Pending < IOErrorEnum
      def code : Int32
        20
      end
    end

    class ReadOnly < IOErrorEnum
      def code : Int32
        21
      end
    end

    class CantCreateBackup < IOErrorEnum
      def code : Int32
        22
      end
    end

    class WrongEtag < IOErrorEnum
      def code : Int32
        23
      end
    end

    class TimedOut < IOErrorEnum
      def code : Int32
        24
      end
    end

    class WouldRecurse < IOErrorEnum
      def code : Int32
        25
      end
    end

    class Busy < IOErrorEnum
      def code : Int32
        26
      end
    end

    class WouldBlock < IOErrorEnum
      def code : Int32
        27
      end
    end

    class HostNotFound < IOErrorEnum
      def code : Int32
        28
      end
    end

    class WouldMerge < IOErrorEnum
      def code : Int32
        29
      end
    end

    class FailedHandled < IOErrorEnum
      def code : Int32
        30
      end
    end

    class TooManyOpenFiles < IOErrorEnum
      def code : Int32
        31
      end
    end

    class NotInitialized < IOErrorEnum
      def code : Int32
        32
      end
    end

    class AddressInUse < IOErrorEnum
      def code : Int32
        33
      end
    end

    class PartialInput < IOErrorEnum
      def code : Int32
        34
      end
    end

    class InvalidData < IOErrorEnum
      def code : Int32
        35
      end
    end

    class DbusError < IOErrorEnum
      def code : Int32
        36
      end
    end

    class HostUnreachable < IOErrorEnum
      def code : Int32
        37
      end
    end

    class NetworkUnreachable < IOErrorEnum
      def code : Int32
        38
      end
    end

    class ConnectionRefused < IOErrorEnum
      def code : Int32
        39
      end
    end

    class ProxyFailed < IOErrorEnum
      def code : Int32
        40
      end
    end

    class ProxyAuthFailed < IOErrorEnum
      def code : Int32
        41
      end
    end

    class ProxyNeedAuth < IOErrorEnum
      def code : Int32
        42
      end
    end

    class ProxyNotAllowed < IOErrorEnum
      def code : Int32
        43
      end
    end

    class BrokenPipe < IOErrorEnum
      def code : Int32
        44
      end
    end

    class ConnectionClosed < IOErrorEnum
      def code : Int32
        44
      end
    end

    class NotConnected < IOErrorEnum
      def code : Int32
        45
      end
    end

    class MessageTooLarge < IOErrorEnum
      def code : Int32
        46
      end
    end
  end

  # An error code used with %G_RESOLVER_ERROR in a #GError returned
  # from a #GResolver routine.
  class ResolverError < GioError
    class NotFound < ResolverError
      def code : Int32
        0
      end
    end

    class TemporaryFailure < ResolverError
      def code : Int32
        1
      end
    end

    class Internal < ResolverError
      def code : Int32
        2
      end
    end
  end

  # An error code used with %G_RESOURCE_ERROR in a #GError returned
  # from a #GResource routine.
  class ResourceError < GioError
    class NotFound < ResourceError
      def code : Int32
        0
      end
    end

    class Internal < ResourceError
      def code : Int32
        1
      end
    end
  end

  # An error code used with %G_TLS_CHANNEL_BINDING_ERROR in a #GError to
  # indicate a TLS channel binding retrieval error.
  class TlsChannelBindingError < GioError
    class NotImplemented < TlsChannelBindingError
      def code : Int32
        0
      end
    end

    class InvalidState < TlsChannelBindingError
      def code : Int32
        1
      end
    end

    class NotAvailable < TlsChannelBindingError
      def code : Int32
        2
      end
    end

    class NotSupported < TlsChannelBindingError
      def code : Int32
        3
      end
    end

    class GeneralError < TlsChannelBindingError
      def code : Int32
        4
      end
    end
  end

  # An error code used with %G_TLS_ERROR in a #GError returned from a
  # TLS-related routine.
  class TlsError < GioError
    class Unavailable < TlsError
      def code : Int32
        0
      end
    end

    class Misc < TlsError
      def code : Int32
        1
      end
    end

    class BadCertificate < TlsError
      def code : Int32
        2
      end
    end

    class NotTls < TlsError
      def code : Int32
        3
      end
    end

    class Handshake < TlsError
      def code : Int32
        4
      end
    end

    class CertificateRequired < TlsError
      def code : Int32
        5
      end
    end

    class Eof < TlsError
      def code : Int32
        6
      end
    end

    class InappropriateFallback < TlsError
      def code : Int32
        7
      end
    end

    class BadCertificatePassword < TlsError
      def code : Int32
        8
      end
    end
  end

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    error_domain = error.value.domain
    error_code = error.value.code

    if error_domain == LibGLib.g_quark_try_string("g-dbus-error-quark")
      raise DBusError::Failed.new(error) if error_code == 0
      raise DBusError::NoMemory.new(error) if error_code == 1
      raise DBusError::ServiceUnknown.new(error) if error_code == 2
      raise DBusError::NameHasNoOwner.new(error) if error_code == 3
      raise DBusError::NoReply.new(error) if error_code == 4
      raise DBusError::IoError.new(error) if error_code == 5
      raise DBusError::BadAddress.new(error) if error_code == 6
      raise DBusError::NotSupported.new(error) if error_code == 7
      raise DBusError::LimitsExceeded.new(error) if error_code == 8
      raise DBusError::AccessDenied.new(error) if error_code == 9
      raise DBusError::AuthFailed.new(error) if error_code == 10
      raise DBusError::NoServer.new(error) if error_code == 11
      raise DBusError::Timeout.new(error) if error_code == 12
      raise DBusError::NoNetwork.new(error) if error_code == 13
      raise DBusError::AddressInUse.new(error) if error_code == 14
      raise DBusError::Disconnected.new(error) if error_code == 15
      raise DBusError::InvalidArgs.new(error) if error_code == 16
      raise DBusError::FileNotFound.new(error) if error_code == 17
      raise DBusError::FileExists.new(error) if error_code == 18
      raise DBusError::UnknownMethod.new(error) if error_code == 19
      raise DBusError::TimedOut.new(error) if error_code == 20
      raise DBusError::MatchRuleNotFound.new(error) if error_code == 21
      raise DBusError::MatchRuleInvalid.new(error) if error_code == 22
      raise DBusError::SpawnExecFailed.new(error) if error_code == 23
      raise DBusError::SpawnForkFailed.new(error) if error_code == 24
      raise DBusError::SpawnChildExited.new(error) if error_code == 25
      raise DBusError::SpawnChildSignaled.new(error) if error_code == 26
      raise DBusError::SpawnFailed.new(error) if error_code == 27
      raise DBusError::SpawnSetupFailed.new(error) if error_code == 28
      raise DBusError::SpawnConfigInvalid.new(error) if error_code == 29
      raise DBusError::SpawnServiceInvalid.new(error) if error_code == 30
      raise DBusError::SpawnServiceNotFound.new(error) if error_code == 31
      raise DBusError::SpawnPermissionsInvalid.new(error) if error_code == 32
      raise DBusError::SpawnFileInvalid.new(error) if error_code == 33
      raise DBusError::SpawnNoMemory.new(error) if error_code == 34
      raise DBusError::UnixProcessIdUnknown.new(error) if error_code == 35
      raise DBusError::InvalidSignature.new(error) if error_code == 36
      raise DBusError::InvalidFileContent.new(error) if error_code == 37
      raise DBusError::SelinuxSecurityContextUnknown.new(error) if error_code == 38
      raise DBusError::AdtAuditDataUnknown.new(error) if error_code == 39
      raise DBusError::ObjectPathInUse.new(error) if error_code == 40
      raise DBusError::UnknownObject.new(error) if error_code == 41
      raise DBusError::UnknownInterface.new(error) if error_code == 42
      raise DBusError::UnknownProperty.new(error) if error_code == 43
      raise DBusError::PropertyReadOnly.new(error) if error_code == 44
    end

    if error_domain == LibGLib.g_quark_try_string("g-io-error-quark")
      raise IOErrorEnum::Failed.new(error) if error_code == 0
      raise IOErrorEnum::NotFound.new(error) if error_code == 1
      raise IOErrorEnum::Exists.new(error) if error_code == 2
      raise IOErrorEnum::IsDirectory.new(error) if error_code == 3
      raise IOErrorEnum::NotDirectory.new(error) if error_code == 4
      raise IOErrorEnum::NotEmpty.new(error) if error_code == 5
      raise IOErrorEnum::NotRegularFile.new(error) if error_code == 6
      raise IOErrorEnum::NotSymbolicLink.new(error) if error_code == 7
      raise IOErrorEnum::NotMountableFile.new(error) if error_code == 8
      raise IOErrorEnum::FilenameTooLong.new(error) if error_code == 9
      raise IOErrorEnum::InvalidFilename.new(error) if error_code == 10
      raise IOErrorEnum::TooManyLinks.new(error) if error_code == 11
      raise IOErrorEnum::NoSpace.new(error) if error_code == 12
      raise IOErrorEnum::InvalidArgument.new(error) if error_code == 13
      raise IOErrorEnum::PermissionDenied.new(error) if error_code == 14
      raise IOErrorEnum::NotSupported.new(error) if error_code == 15
      raise IOErrorEnum::NotMounted.new(error) if error_code == 16
      raise IOErrorEnum::AlreadyMounted.new(error) if error_code == 17
      raise IOErrorEnum::Closed.new(error) if error_code == 18
      raise IOErrorEnum::Cancelled.new(error) if error_code == 19
      raise IOErrorEnum::Pending.new(error) if error_code == 20
      raise IOErrorEnum::ReadOnly.new(error) if error_code == 21
      raise IOErrorEnum::CantCreateBackup.new(error) if error_code == 22
      raise IOErrorEnum::WrongEtag.new(error) if error_code == 23
      raise IOErrorEnum::TimedOut.new(error) if error_code == 24
      raise IOErrorEnum::WouldRecurse.new(error) if error_code == 25
      raise IOErrorEnum::Busy.new(error) if error_code == 26
      raise IOErrorEnum::WouldBlock.new(error) if error_code == 27
      raise IOErrorEnum::HostNotFound.new(error) if error_code == 28
      raise IOErrorEnum::WouldMerge.new(error) if error_code == 29
      raise IOErrorEnum::FailedHandled.new(error) if error_code == 30
      raise IOErrorEnum::TooManyOpenFiles.new(error) if error_code == 31
      raise IOErrorEnum::NotInitialized.new(error) if error_code == 32
      raise IOErrorEnum::AddressInUse.new(error) if error_code == 33
      raise IOErrorEnum::PartialInput.new(error) if error_code == 34
      raise IOErrorEnum::InvalidData.new(error) if error_code == 35
      raise IOErrorEnum::DbusError.new(error) if error_code == 36
      raise IOErrorEnum::HostUnreachable.new(error) if error_code == 37
      raise IOErrorEnum::NetworkUnreachable.new(error) if error_code == 38
      raise IOErrorEnum::ConnectionRefused.new(error) if error_code == 39
      raise IOErrorEnum::ProxyFailed.new(error) if error_code == 40
      raise IOErrorEnum::ProxyAuthFailed.new(error) if error_code == 41
      raise IOErrorEnum::ProxyNeedAuth.new(error) if error_code == 42
      raise IOErrorEnum::ProxyNotAllowed.new(error) if error_code == 43
      raise IOErrorEnum::BrokenPipe.new(error) if error_code == 44
      raise IOErrorEnum::ConnectionClosed.new(error) if error_code == 44
      raise IOErrorEnum::NotConnected.new(error) if error_code == 45
      raise IOErrorEnum::MessageTooLarge.new(error) if error_code == 46
    end

    if error_domain == LibGLib.g_quark_try_string("g-resolver-error-quark")
      raise ResolverError::NotFound.new(error) if error_code == 0
      raise ResolverError::TemporaryFailure.new(error) if error_code == 1
      raise ResolverError::Internal.new(error) if error_code == 2
    end

    if error_domain == LibGLib.g_quark_try_string("g-resource-error-quark")
      raise ResourceError::NotFound.new(error) if error_code == 0
      raise ResourceError::Internal.new(error) if error_code == 1
    end

    if error_domain == LibGLib.g_quark_try_string("g-tls-channel-binding-error-quark")
      raise TlsChannelBindingError::NotImplemented.new(error) if error_code == 0
      raise TlsChannelBindingError::InvalidState.new(error) if error_code == 1
      raise TlsChannelBindingError::NotAvailable.new(error) if error_code == 2
      raise TlsChannelBindingError::NotSupported.new(error) if error_code == 3
      raise TlsChannelBindingError::GeneralError.new(error) if error_code == 4
    end

    if error_domain == LibGLib.g_quark_try_string("g-tls-error-quark")
      raise TlsError::Unavailable.new(error) if error_code == 0
      raise TlsError::Misc.new(error) if error_code == 1
      raise TlsError::BadCertificate.new(error) if error_code == 2
      raise TlsError::NotTls.new(error) if error_code == 3
      raise TlsError::Handshake.new(error) if error_code == 4
      raise TlsError::CertificateRequired.new(error) if error_code == 5
      raise TlsError::Eof.new(error) if error_code == 6
      raise TlsError::InappropriateFallback.new(error) if error_code == 7
      raise TlsError::BadCertificatePassword.new(error) if error_code == 8
    end

    GObject.raise_exception(error)
  end

  extend self
end

# Extra includes
require "../../../lib/gtk4/src/bindings/gio/application.cr"
require "../../../lib/gtk4/src/bindings/gio/resource.cr"
