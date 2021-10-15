require "../g_object-2.0/object"

module Gtk
  # Layout managers are delegate classes that handle the preferred size
  # and the allocation of a widget.
  #
  # You typically subclass `GtkLayoutManager` if you want to implement a
  # layout policy for the children of a widget, or if you want to determine
  # the size of a widget depending on its contents.
  #
  # Each `GtkWidget` can only have a `GtkLayoutManager` instance associated
  # to it at any given time; it is possible, though, to replace the layout
  # manager instance using [method@Gtk.Widget.set_layout_manager].
  #
  # ## Layout properties
  #
  # A layout manager can expose properties for controlling the layout of
  # each child, by creating an object type derived from [class@Gtk.LayoutChild]
  # and installing the properties on it as normal `GObject` properties.
  #
  # Each `GtkLayoutChild` instance storing the layout properties for a
  # specific child is created through the [method@Gtk.LayoutManager.get_layout_child]
  # method; a `GtkLayoutManager` controls the creation of its `GtkLayoutChild`
  # instances by overriding the GtkLayoutManagerClass.create_layout_child()
  # virtual function. The typical implementation should look like:
  #
  # ```c
  # static GtkLayoutChild *
  # create_layout_child (GtkLayoutManager *manager,
  #                      GtkWidget        *container,
  #                      GtkWidget        *child)
  # {
  #   return g_object_new (your_layout_child_get_type (),
  #                        "layout-manager", manager,
  #                        "child-widget", child,
  #                        NULL);
  # }
  # ```
  #
  # The [property@Gtk.LayoutChild:layout-manager] and
  # [property@Gtk.LayoutChild:child-widget] properties
  # on the newly created `GtkLayoutChild` instance are mandatory. The
  # `GtkLayoutManager` will cache the newly created `GtkLayoutChild` instance
  # until the widget is removed from its parent, or the parent removes the
  # layout manager.
  #
  # Each `GtkLayoutManager` instance creating a `GtkLayoutChild` should use
  # [method@Gtk.LayoutManager.get_layout_child] every time it needs to query
  # the layout properties; each `GtkLayoutChild` instance should call
  # [method@Gtk.LayoutManager.layout_changed] every time a property is
  # updated, in order to queue a new size measuring and allocation.
  class LayoutManager < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_layout_manager_get_type
    end

    def allocate(widget : Gtk::Widget, width : Int32, height : Int32, baseline : Int32) : Nil
      # gtk_layout_manager_allocate: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_layout_manager_allocate(self, widget, width, height, baseline)
    end

    def layout_child(child : Gtk::Widget) : Gtk::LayoutChild
      # gtk_layout_manager_get_layout_child: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_layout_manager_get_layout_child(self, child)
      Gtk::LayoutChild.new(_retval, GICrystal::Transfer::None)
    end

    def request_mode : Gtk::SizeRequestMode
      # gtk_layout_manager_get_request_mode: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_layout_manager_get_request_mode(self)
      Gtk::SizeRequestMode.from_value(_retval)
    end

    def widget : Gtk::Widget?
      # gtk_layout_manager_get_widget: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_layout_manager_get_widget(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def layout_changed : Nil
      # gtk_layout_manager_layout_changed: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_layout_manager_layout_changed(self)
    end

    def measure(widget : Gtk::Widget, orientation : Gtk::Orientation, for_size : Int32) : Nil
      # gtk_layout_manager_measure: (Method)
      # @minimum: (out) (transfer full) (optional)
      # @natural: (out) (transfer full) (optional)
      # @minimum_baseline: (out) (transfer full) (optional)
      # @natural_baseline: (out) (transfer full) (optional)
      # Returns: (transfer none)

      minimum = Pointer(Int32).null
      natural = Pointer(Int32).null
      minimum_baseline = Pointer(Int32).null
      natural_baseline = Pointer(Int32).null

      LibGtk.gtk_layout_manager_measure(self, widget, orientation, for_size, minimum, natural, minimum_baseline, natural_baseline)
    end
  end
end
