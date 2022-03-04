require "../g_object-2.0/object"
require "./app_info"

module Gio
  # #GDesktopAppInfo is an implementation of #GAppInfo based on
  # desktop files.
  #
  # Note that `<gio/gdesktopappinfo.h>` belongs to the UNIX-specific
  # GIO interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
  # file when using it.
  class DesktopAppInfo < GObject::Object
    include AppInfo

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, filename : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if filename
        (_names.to_unsafe + _n).value = "filename".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, filename)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DesktopAppInfo.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_desktop_app_info_get_type
    end

    def filename=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "filename", unsafe_value, Pointer(Void).null)
      value
    end

    def filename : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "filename", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def initialize(desktop_id : ::String)
      # g_desktop_app_info_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_new(desktop_id)

      # Return value handling
      @pointer = _retval unless _retval.null?
    end

    def self.new_from_filename(filename : ::String) : self?
      # g_desktop_app_info_new_from_filename: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_new_from_filename(filename)

      # Return value handling
      Gio::DesktopAppInfo.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.new_from_keyfile(key_file : GLib::KeyFile) : self?
      # g_desktop_app_info_new_from_keyfile: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_new_from_keyfile(key_file)

      # Return value handling
      Gio::DesktopAppInfo.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.implementations(interface : ::String) : GLib::List
      # g_desktop_app_info_get_implementations: (None)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_get_implementations(interface)

      # Return value handling
      GLib::List(Gio::DesktopAppInfo).new(_retval, GICrystal::Transfer::Full)
    end

    def self.search(search_string : ::String) : Enumerable(Enumerable(::String))
      # g_desktop_app_info_search: (None)
      # Returns: (transfer full) (array zero-terminated=1 element-type Array)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_search(search_string)

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def self.desktop_env=(desktop_env : ::String) : Nil
      # g_desktop_app_info_set_desktop_env: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_desktop_app_info_set_desktop_env(desktop_env)

      # Return value handling
    end

    def action_name(action_name : ::String) : ::String
      # g_desktop_app_info_get_action_name: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_get_action_name(self, action_name)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def boolean(key : ::String) : Bool
      # g_desktop_app_info_get_boolean: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_get_boolean(self, key)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def categories : ::String?
      # g_desktop_app_info_get_categories: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_get_categories(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def filename : ::Path?
      # g_desktop_app_info_get_filename: (Method | Getter)
      # Returns: (transfer none Filename)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_get_filename(self)

      # Return value handling
      ::Path.new(::String.new(_retval)) unless _retval.null?
    end

    def generic_name : ::String?
      # g_desktop_app_info_get_generic_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_get_generic_name(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def is_hidden : Bool
      # g_desktop_app_info_get_is_hidden: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_get_is_hidden(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def keywords : Enumerable(::String)
      # g_desktop_app_info_get_keywords: (Method)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_get_keywords(self)

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    def locale_string(key : ::String) : ::String?
      # g_desktop_app_info_get_locale_string: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_get_locale_string(self, key)

      # Return value handling
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def nodisplay : Bool
      # g_desktop_app_info_get_nodisplay: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_get_nodisplay(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def show_in(desktop_env : ::String?) : Bool
      # g_desktop_app_info_get_show_in: (Method)
      # @desktop_env: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      desktop_env = if desktop_env.nil?
                      Pointer(LibC::Char).null
                    else
                      desktop_env.to_unsafe
                    end

      # C call
      _retval = LibGio.g_desktop_app_info_get_show_in(self, desktop_env)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def startup_wm_class : ::String?
      # g_desktop_app_info_get_startup_wm_class: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_get_startup_wm_class(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def string(key : ::String) : ::String?
      # g_desktop_app_info_get_string: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_get_string(self, key)

      # Return value handling
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def string_list(key : ::String) : Enumerable(::String)
      # g_desktop_app_info_get_string_list: (Method)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full) (array length=length zero-terminated=1 element-type Utf8)

      # Handle parameters
      length = 0_u64

      # C call
      _retval = LibGio.g_desktop_app_info_get_string_list(self, key, pointerof(length))

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def has_key(key : ::String) : Bool
      # g_desktop_app_info_has_key: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_has_key(self, key)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def launch_action(action_name : ::String, launch_context : Gio::AppLaunchContext?) : Nil
      # g_desktop_app_info_launch_action: (Method)
      # @launch_context: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      launch_context = if launch_context.nil?
                         Pointer(Void).null
                       else
                         launch_context.to_unsafe
                       end

      # C call
      LibGio.g_desktop_app_info_launch_action(self, action_name, launch_context)

      # Return value handling
    end

    def launch_uris_as_manager(uris : GLib::List, launch_context : Gio::AppLaunchContext?, spawn_flags : GLib::SpawnFlags, user_setup : Pointer(Void)?, user_setup_data : Pointer(Void)?, pid_callback : Pointer(Void)?, pid_callback_data : Pointer(Void)?) : Bool
      # g_desktop_app_info_launch_uris_as_manager: (Method | Throws)
      # @launch_context: (nullable)
      # @user_setup: (nullable)
      # @user_setup_data: (nullable)
      # @pid_callback: (nullable)
      # @pid_callback_data: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      launch_context = if launch_context.nil?
                         Pointer(Void).null
                       else
                         launch_context.to_unsafe
                       end
      user_setup = if user_setup.nil?
                     LibGLib::SpawnChildSetupFunc.null
                   else
                     user_setup.to_unsafe
                   end
      user_setup_data = if user_setup_data.nil?
                          Pointer(Void).null
                        else
                          user_setup_data.to_unsafe
                        end
      pid_callback = if pid_callback.nil?
                       LibGio::DesktopAppLaunchCallback.null
                     else
                       pid_callback.to_unsafe
                     end
      pid_callback_data = if pid_callback_data.nil?
                            Pointer(Void).null
                          else
                            pid_callback_data.to_unsafe
                          end

      # C call
      _retval = LibGio.g_desktop_app_info_launch_uris_as_manager(self, uris, launch_context, spawn_flags, user_setup, user_setup_data, pid_callback, pid_callback_data, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def launch_uris_as_manager_with_fds(uris : GLib::List, launch_context : Gio::AppLaunchContext?, spawn_flags : GLib::SpawnFlags, user_setup : Pointer(Void)?, user_setup_data : Pointer(Void)?, pid_callback : Pointer(Void)?, pid_callback_data : Pointer(Void)?, stdin_fd : Int32, stdout_fd : Int32, stderr_fd : Int32) : Bool
      # g_desktop_app_info_launch_uris_as_manager_with_fds: (Method | Throws)
      # @launch_context: (nullable)
      # @user_setup: (nullable)
      # @user_setup_data: (nullable)
      # @pid_callback: (nullable)
      # @pid_callback_data: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      launch_context = if launch_context.nil?
                         Pointer(Void).null
                       else
                         launch_context.to_unsafe
                       end
      user_setup = if user_setup.nil?
                     LibGLib::SpawnChildSetupFunc.null
                   else
                     user_setup.to_unsafe
                   end
      user_setup_data = if user_setup_data.nil?
                          Pointer(Void).null
                        else
                          user_setup_data.to_unsafe
                        end
      pid_callback = if pid_callback.nil?
                       LibGio::DesktopAppLaunchCallback.null
                     else
                       pid_callback.to_unsafe
                     end
      pid_callback_data = if pid_callback_data.nil?
                            Pointer(Void).null
                          else
                            pid_callback_data.to_unsafe
                          end

      # C call
      _retval = LibGio.g_desktop_app_info_launch_uris_as_manager_with_fds(self, uris, launch_context, spawn_flags, user_setup, user_setup_data, pid_callback, pid_callback_data, stdin_fd, stdout_fd, stderr_fd, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def list_actions : Enumerable(::String)
      # g_desktop_app_info_list_actions: (Method)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # Handle parameters

      # C call
      _retval = LibGio.g_desktop_app_info_list_actions(self)

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end
  end
end
