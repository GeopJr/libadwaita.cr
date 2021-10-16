require "../gio-2.0/mount_operation"

module Gtk
  # `GtkMountOperation` is an implementation of `GMountOperation`.
  #
  # The functions and objects described here make working with GTK and
  # GIO more convenient.
  #
  # `GtkMountOperation` is needed when mounting volumes:
  # It is an implementation of `GMountOperation` that can be used with
  # GIO functions for mounting volumes such as
  # g_file_mount_enclosing_volume(), g_file_mount_mountable(),
  # g_volume_mount(), g_mount_unmount_with_operation() and others.
  #
  # When necessary, `GtkMountOperation` shows dialogs to let the user
  # enter passwords, ask questions or show processes blocking unmount.
  class MountOperation < Gio::MountOperation
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, anonymous : Bool? = nil, choice : Int32? = nil, display : Gdk::Display? = nil, domain : ::String? = nil, is_showing : Bool? = nil, is_tcrypt_hidden_volume : Bool? = nil, is_tcrypt_system_volume : Bool? = nil, parent : Gtk::Window? = nil, password : ::String? = nil, password_save : Gio::PasswordSave? = nil, pim : UInt32? = nil, username : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[12]
      _values = StaticArray(LibGObject::Value, 12).new(LibGObject::Value.new)
      _n = 0

      if anonymous
        (_names.to_unsafe + _n).value = "anonymous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, anonymous)
        _n += 1
      end
      if choice
        (_names.to_unsafe + _n).value = "choice".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, choice)
        _n += 1
      end
      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if domain
        (_names.to_unsafe + _n).value = "domain".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, domain)
        _n += 1
      end
      if is_showing
        (_names.to_unsafe + _n).value = "is-showing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_showing)
        _n += 1
      end
      if is_tcrypt_hidden_volume
        (_names.to_unsafe + _n).value = "is-tcrypt-hidden-volume".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_tcrypt_hidden_volume)
        _n += 1
      end
      if is_tcrypt_system_volume
        (_names.to_unsafe + _n).value = "is-tcrypt-system-volume".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_tcrypt_system_volume)
        _n += 1
      end
      if parent
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if password
        (_names.to_unsafe + _n).value = "password".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, password)
        _n += 1
      end
      if password_save
        (_names.to_unsafe + _n).value = "password-save".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, password_save)
        _n += 1
      end
      if pim
        (_names.to_unsafe + _n).value = "pim".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pim)
        _n += 1
      end
      if username
        (_names.to_unsafe + _n).value = "username".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, username)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(MountOperation.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_mount_operation_get_type
    end

    def display=(value : Gdk::Display?) : Gdk::Display?
      unsafe_value = value

      LibGObject.g_object_set(self, "display", unsafe_value, Pointer(Void).null)
      value
    end

    def display : Gdk::Display?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "display", pointerof(value), Pointer(Void).null)
      Gdk::Display.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def is_showing? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-showing", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def parent=(value : Gtk::Window?) : Gtk::Window?
      unsafe_value = value

      LibGObject.g_object_set(self, "parent", unsafe_value, Pointer(Void).null)
      value
    end

    def parent : Gtk::Window?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "parent", pointerof(value), Pointer(Void).null)
      Gtk::Window.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize(parent : Gtk::Window?)
      # gtk_mount_operation_new: (Constructor)
      # @parent: (nullable)
      # Returns: (transfer full)

      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      _retval = LibGtk.gtk_mount_operation_new(parent)
      @pointer = _retval
    end

    def display : Gdk::Display
      # gtk_mount_operation_get_display: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_mount_operation_get_display(self)
      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    def parent : Gtk::Window
      # gtk_mount_operation_get_parent: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_mount_operation_get_parent(self)
      Gtk::Window.new(_retval, GICrystal::Transfer::None)
    end

    def is_showing : Bool
      # gtk_mount_operation_is_showing: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_mount_operation_is_showing(self)
      GICrystal.to_bool(_retval)
    end

    def display=(display : Gdk::Display) : Nil
      # gtk_mount_operation_set_display: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_mount_operation_set_display(self, display)
    end

    def parent=(parent : Gtk::Window?) : Nil
      # gtk_mount_operation_set_parent: (Method)
      # @parent: (nullable)
      # Returns: (transfer none)

      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      LibGtk.gtk_mount_operation_set_parent(self, parent)
    end
  end
end
