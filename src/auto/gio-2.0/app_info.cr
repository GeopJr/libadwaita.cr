module Gio
  # #GAppInfo and #GAppLaunchContext are used for describing and launching
  # applications installed on the system.
  #
  # As of GLib 2.20, URIs will always be converted to POSIX paths
  # (using g_file_get_path()) when using g_app_info_launch() even if
  # the application requested an URI and not a POSIX path. For example
  # for a desktop-file based application with Exec key `totem
  # %U` and a single URI, `sftp://foo/file.avi`, then
  # `/home/user/.gvfs/sftp on foo/file.avi` will be passed. This will
  # only work if a set of suitable GIO extensions (such as gvfs 2.26
  # compiled with FUSE support), is available and operational; if this
  # is not the case, the URI will be passed unmodified to the application.
  # Some URIs, such as `mailto:`, of course cannot be mapped to a POSIX
  # path (in gvfs there's no FUSE mount for it); such URIs will be
  # passed unmodified to the application.
  #
  # Specifically for gvfs 2.26 and later, the POSIX URI will be mapped
  # back to the GIO URI in the #GFile constructors (since gvfs
  # implements the #GVfs extension point). As such, if the application
  # needs to examine the URI, it needs to use g_file_get_uri() or
  # similar on #GFile. In other words, an application cannot assume
  # that the URI passed to e.g. g_file_new_for_commandline_arg() is
  # equal to the result of g_file_get_uri(). The following snippet
  # illustrates this:
  #
  # |[
  # GFile *f;
  # char *uri;
  #
  # file = g_file_new_for_commandline_arg (uri_from_commandline);
  #
  # uri = g_file_get_uri (file);
  # strcmp (uri, uri_from_commandline) == 0;
  # g_free (uri);
  #
  # if (g_file_has_uri_scheme (file, "cdda"))
  #   {
  #     // do something special with uri
  #   }
  # g_object_unref (file);
  # ]|
  #
  # This code will work when both `cdda://sr0/Track 1.wav` and
  # `/home/user/.gvfs/cdda on sr0/Track 1.wav` is passed to the
  # application. It should be noted that it's generally not safe
  # for applications to rely on the format of a particular URIs.
  # Different launcher applications (e.g. file managers) may have
  # different ideas of what a given URI means.
  module AppInfo
    def create_from_commandline(commandline : ::String, application_name : ::String?, flags : Gio::AppInfoCreateFlags) : Gio::AppInfo
      # g_app_info_create_from_commandline: (Throws)
      # @application_name: (nullable)
      # Returns: (transfer full)

      application_name = if application_name.nil?
                           Pointer(LibC::Char).null
                         else
                           application_name.to_unsafe
                         end

      _retval = LibGio.g_app_info_create_from_commandline(commandline, application_name, flags)
      Gio::AppInfo__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def self.all : GLib::List
      # g_app_info_get_all: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_app_info_get_all
      GLib::List(Gio::AppInfo).new(_retval, GICrystal::Transfer::Full)
    end

    def self.all_for_type(content_type : ::String) : GLib::List
      # g_app_info_get_all_for_type: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_app_info_get_all_for_type(content_type)
      GLib::List(Gio::AppInfo).new(_retval, GICrystal::Transfer::Full)
    end

    def self.default_for_type(content_type : ::String, must_support_uris : Bool) : Gio::AppInfo?
      # g_app_info_get_default_for_type: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_app_info_get_default_for_type(content_type, must_support_uris)
      Gio::AppInfo__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.default_for_uri_scheme(uri_scheme : ::String) : Gio::AppInfo?
      # g_app_info_get_default_for_uri_scheme: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_app_info_get_default_for_uri_scheme(uri_scheme)
      Gio::AppInfo__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.fallback_for_type(content_type : ::String) : GLib::List
      # g_app_info_get_fallback_for_type: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_app_info_get_fallback_for_type(content_type)
      GLib::List(Gio::AppInfo).new(_retval, GICrystal::Transfer::Full)
    end

    def self.recommended_for_type(content_type : ::String) : GLib::List
      # g_app_info_get_recommended_for_type: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_app_info_get_recommended_for_type(content_type)
      GLib::List(Gio::AppInfo).new(_retval, GICrystal::Transfer::Full)
    end

    def launch_default_for_uri(uri : ::String, context : Gio::AppLaunchContext?) : Bool
      # g_app_info_launch_default_for_uri: (Throws)
      # @context: (nullable)
      # Returns: (transfer none)

      context = if context.nil?
                  Pointer(Void).null
                else
                  context.to_unsafe
                end

      _retval = LibGio.g_app_info_launch_default_for_uri(uri, context)
      GICrystal.to_bool(_retval)
    end

    def self.launch_default_for_uri_async(uri : ::String, context : Gio::AppLaunchContext?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_app_info_launch_default_for_uri_async: (None)
      # @context: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      context = if context.nil?
                  Pointer(Void).null
                else
                  context.to_unsafe
                end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_app_info_launch_default_for_uri_async(uri, context, cancellable, callback, user_data)
    end

    def launch_default_for_uri_finish(result : Gio::AsyncResult) : Bool
      # g_app_info_launch_default_for_uri_finish: (Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_launch_default_for_uri_finish(result)
      GICrystal.to_bool(_retval)
    end

    def self.reset_type_associations(content_type : ::String) : Nil
      # g_app_info_reset_type_associations: (None)
      # Returns: (transfer none)

      LibGio.g_app_info_reset_type_associations(content_type)
    end

    def add_supports_type(content_type : ::String) : Bool
      # g_app_info_add_supports_type: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_add_supports_type(self, content_type)
      GICrystal.to_bool(_retval)
    end

    def can_delete : Bool
      # g_app_info_can_delete: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_can_delete(self)
      GICrystal.to_bool(_retval)
    end

    def can_remove_supports_type : Bool
      # g_app_info_can_remove_supports_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_can_remove_supports_type(self)
      GICrystal.to_bool(_retval)
    end

    def delete : Bool
      # g_app_info_delete: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_delete(self)
      GICrystal.to_bool(_retval)
    end

    def dup : Gio::AppInfo
      # g_app_info_dup: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_app_info_dup(self)
      Gio::AppInfo__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def equal(appinfo2 : Gio::AppInfo) : Bool
      # g_app_info_equal: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_equal(self, appinfo2)
      GICrystal.to_bool(_retval)
    end

    def commandline : ::Path?
      # g_app_info_get_commandline: (Method)
      # Returns: (transfer none Filename)

      _retval = LibGio.g_app_info_get_commandline(self)
      ::Path.new(::String.new(_retval)) unless _retval.null?
    end

    def description : ::String?
      # g_app_info_get_description: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_get_description(self)
      ::String.new(_retval) unless _retval.null?
    end

    def display_name : ::String
      # g_app_info_get_display_name: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_get_display_name(self)
      ::String.new(_retval)
    end

    def executable : ::Path
      # g_app_info_get_executable: (Method)
      # Returns: (transfer none Filename)

      _retval = LibGio.g_app_info_get_executable(self)
      ::Path.new(::String.new(_retval))
    end

    def icon : Gio::Icon?
      # g_app_info_get_icon: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_get_icon(self)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def id : ::String?
      # g_app_info_get_id: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_get_id(self)
      ::String.new(_retval) unless _retval.null?
    end

    def name : ::String
      # g_app_info_get_name: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_get_name(self)
      ::String.new(_retval)
    end

    def supported_types : Enumerable(::String)
      # g_app_info_get_supported_types: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_get_supported_types(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    def launch(files : GLib::List?, context : Gio::AppLaunchContext?) : Bool
      # g_app_info_launch: (Method | Throws)
      # @files: (nullable)
      # @context: (nullable)
      # Returns: (transfer none)

      files = if files.nil?
                Pointer(LibGLib::List).null
              else
                files.to_unsafe
              end
      context = if context.nil?
                  Pointer(Void).null
                else
                  context.to_unsafe
                end

      _retval = LibGio.g_app_info_launch(self, files, context)
      GICrystal.to_bool(_retval)
    end

    def launch_uris(uris : GLib::List?, context : Gio::AppLaunchContext?) : Bool
      # g_app_info_launch_uris: (Method | Throws)
      # @uris: (nullable)
      # @context: (nullable)
      # Returns: (transfer none)

      uris = if uris.nil?
               Pointer(LibGLib::List).null
             else
               uris.to_unsafe
             end
      context = if context.nil?
                  Pointer(Void).null
                else
                  context.to_unsafe
                end

      _retval = LibGio.g_app_info_launch_uris(self, uris, context)
      GICrystal.to_bool(_retval)
    end

    def launch_uris_async(uris : GLib::List?, context : Gio::AppLaunchContext?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_app_info_launch_uris_async: (Method)
      # @uris: (nullable)
      # @context: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      uris = if uris.nil?
               Pointer(LibGLib::List).null
             else
               uris.to_unsafe
             end
      context = if context.nil?
                  Pointer(Void).null
                else
                  context.to_unsafe
                end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_app_info_launch_uris_async(self, uris, context, cancellable, callback, user_data)
    end

    def launch_uris_finish(result : Gio::AsyncResult) : Bool
      # g_app_info_launch_uris_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_launch_uris_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def remove_supports_type(content_type : ::String) : Bool
      # g_app_info_remove_supports_type: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_remove_supports_type(self, content_type)
      GICrystal.to_bool(_retval)
    end

    def as_default_for_extension=(extension : ::String) : Bool
      # g_app_info_set_as_default_for_extension: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_set_as_default_for_extension(self, extension)
      GICrystal.to_bool(_retval)
    end

    def as_default_for_type=(content_type : ::String) : Bool
      # g_app_info_set_as_default_for_type: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_set_as_default_for_type(self, content_type)
      GICrystal.to_bool(_retval)
    end

    def as_last_used_for_type=(content_type : ::String) : Bool
      # g_app_info_set_as_last_used_for_type: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_set_as_last_used_for_type(self, content_type)
      GICrystal.to_bool(_retval)
    end

    def should_show : Bool
      # g_app_info_should_show: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_should_show(self)
      GICrystal.to_bool(_retval)
    end

    def supports_files : Bool
      # g_app_info_supports_files: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_supports_files(self)
      GICrystal.to_bool(_retval)
    end

    def supports_uris : Bool
      # g_app_info_supports_uris: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_app_info_supports_uris(self)
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class AppInfo__Impl
    include AppInfo

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_app_info_get_type
    end

    # Cast a `GObject::Object` to `AppInfo`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to AppInfo")
    end

    # Cast a `GObject::Object` to `AppInfo`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
