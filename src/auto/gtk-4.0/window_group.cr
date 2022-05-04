require "../g_object-2.0/object"

module Gtk
  # `GtkWindowGroup` makes group of windows behave like separate applications.
  #
  # It achieves this by limiting the effect of GTK grabs and modality
  # to windows in the same group.
  #
  # A window can be a member in at most one window group at a time.
  # Windows that have not been explicitly assigned to a group are
  # implicitly treated like windows of the default window group.
  #
  # `GtkWindowGroup` objects are referenced by each window in the group,
  # so once you have added all windows to a `GtkWindowGroup`, you can drop
  # the initial reference to the window group with g_object_unref(). If the
  # windows in the window group are subsequently destroyed, then they will
  # be removed from the window group and drop their references on the window
  # group; when all window have been removed, the window group will be
  # freed.
  @[GObject::GeneratedWrapper]
  class WindowGroup < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::WindowGroupClass), class_init,
        sizeof(LibGtk::WindowGroup), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_window_group_get_type
    end

    # Creates a new `GtkWindowGroup` object.
    #
    # Modality of windows only affects windows
    # within the same `GtkWindowGroup`.
    def initialize
      # gtk_window_group_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_window_group_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Adds a window to a `GtkWindowGroup`.
    def add_window(window : Gtk::Window) : Nil
      # gtk_window_group_add_window: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_group_add_window(self, window)

      # Return value handling
    end

    # Returns a list of the `GtkWindows` that belong to @window_group.
    def list_windows : GLib::List
      # gtk_window_group_list_windows: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGtk.gtk_window_group_list_windows(self)

      # Return value handling

      GLib::List(Gtk::Window).new(_retval, GICrystal::Transfer::Container)
    end

    # Removes a window from a `GtkWindowGroup`.
    def remove_window(window : Gtk::Window) : Nil
      # gtk_window_group_remove_window: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_group_remove_window(self, window)

      # Return value handling
    end
  end
end
