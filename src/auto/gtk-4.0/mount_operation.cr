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
  @[GObject::GeneratedWrapper]
  class MountOperation < Gio::MountOperation
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::MountOperationClass), class_init,
        sizeof(LibGtk::MountOperation), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, anonymous : Bool? = nil, choice : Int32? = nil, display : Gdk::Display? = nil, domain : ::String? = nil, is_showing : Bool? = nil, is_tcrypt_hidden_volume : Bool? = nil, is_tcrypt_system_volume : Bool? = nil, parent : Gtk::Window? = nil, password : ::String? = nil, password_save : Gio::PasswordSave? = nil, pim : UInt32? = nil, username : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[12]
      _values = StaticArray(LibGObject::Value, 12).new(LibGObject::Value.new)
      _n = 0

      if !anonymous.nil?
        (_names.to_unsafe + _n).value = "anonymous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, anonymous)
        _n += 1
      end
      if !choice.nil?
        (_names.to_unsafe + _n).value = "choice".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, choice)
        _n += 1
      end
      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if !domain.nil?
        (_names.to_unsafe + _n).value = "domain".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, domain)
        _n += 1
      end
      if !is_showing.nil?
        (_names.to_unsafe + _n).value = "is-showing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_showing)
        _n += 1
      end
      if !is_tcrypt_hidden_volume.nil?
        (_names.to_unsafe + _n).value = "is-tcrypt-hidden-volume".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_tcrypt_hidden_volume)
        _n += 1
      end
      if !is_tcrypt_system_volume.nil?
        (_names.to_unsafe + _n).value = "is-tcrypt-system-volume".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_tcrypt_system_volume)
        _n += 1
      end
      if !parent.nil?
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if !password.nil?
        (_names.to_unsafe + _n).value = "password".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, password)
        _n += 1
      end
      if !password_save.nil?
        (_names.to_unsafe + _n).value = "password-save".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, password_save)
        _n += 1
      end
      if !pim.nil?
        (_names.to_unsafe + _n).value = "pim".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pim)
        _n += 1
      end
      if !username.nil?
        (_names.to_unsafe + _n).value = "username".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, username)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(MountOperation.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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

    # Creates a new `GtkMountOperation`.
    def initialize(parent : Gtk::Window?)
      # gtk_mount_operation_new: (Constructor)
      # @parent: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      # C call
      _retval = LibGtk.gtk_mount_operation_new(parent)

      # Return value handling

      @pointer = _retval
    end

    # Gets the display on which windows of the `GtkMountOperation`
    # will be shown.
    def display : Gdk::Display
      # gtk_mount_operation_get_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_mount_operation_get_display(self)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the transient parent used by the `GtkMountOperation`.
    def parent : Gtk::Window?
      # gtk_mount_operation_get_parent: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_mount_operation_get_parent(self)

      # Return value handling

      Gtk::Window.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether the `GtkMountOperation` is currently displaying
    # a window.
    def is_showing? : Bool
      # gtk_mount_operation_is_showing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_mount_operation_is_showing(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the display to show windows of the `GtkMountOperation` on.
    def display=(display : Gdk::Display) : Nil
      # gtk_mount_operation_set_display: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_mount_operation_set_display(self, display)

      # Return value handling
    end

    # Sets the transient parent for windows shown by the
    # `GtkMountOperation`.
    def parent=(parent : Gtk::Window?) : Nil
      # gtk_mount_operation_set_parent: (Method | Setter)
      # @parent: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      # C call
      LibGtk.gtk_mount_operation_set_parent(self, parent)

      # Return value handling
    end
  end
end
