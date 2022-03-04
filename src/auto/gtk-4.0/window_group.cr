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
  class WindowGroup < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_window_group_get_type
    end

    def initialize
      # gtk_window_group_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_window_group_new

      # Return value handling
      @pointer = _retval
    end

    def add_window(window : Gtk::Window) : Nil
      # gtk_window_group_add_window: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_window_group_add_window(self, window)

      # Return value handling
    end

    def list_windows : GLib::List
      # gtk_window_group_list_windows: (Method)
      # Returns: (transfer container)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_window_group_list_windows(self)

      # Return value handling
      GLib::List(Gtk::Window).new(_retval, GICrystal::Transfer::Container)
    end

    def remove_window(window : Gtk::Window) : Nil
      # gtk_window_group_remove_window: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_window_group_remove_window(self, window)

      # Return value handling
    end
  end
end
