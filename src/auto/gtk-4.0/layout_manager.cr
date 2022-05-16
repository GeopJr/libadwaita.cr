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
  # manager instance using `Gtk::Widget#layout_manager=`.
  #
  # ## Layout properties
  #
  # A layout manager can expose properties for controlling the layout of
  # each child, by creating an object type derived from `Gtk#LayoutChild`
  # and installing the properties on it as normal `GObject` properties.
  #
  # Each `GtkLayoutChild` instance storing the layout properties for a
  # specific child is created through the `Gtk::LayoutManager#layout_child`
  # method; a `GtkLayoutManager` controls the creation of its `GtkLayoutChild`
  # instances by overriding the GtkLayoutManagerClass.create_layout_child()
  # virtual function. The typical implementation should look like:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  # `Gtk::LayoutManager#layout_child` every time it needs to query
  # the layout properties; each `GtkLayoutChild` instance should call
  # `Gtk::LayoutManager#layout_changed` every time a property is
  # updated, in order to queue a new size measuring and allocation.
  @[GObject::GeneratedWrapper]
  class LayoutManager < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::LayoutManagerClass), class_init,
        sizeof(LibGtk::LayoutManager), instance_init, 0)
    end

    GICrystal.define_new_method(LayoutManager, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `LayoutManager`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_layout_manager_get_type
    end

    # Assigns the given @width, @height, and @baseline to
    # a @widget, and computes the position and sizes of the children of
    # the @widget using the layout management policy of @manager.
    def allocate(widget : Gtk::Widget, width : Int32, height : Int32, baseline : Int32) : Nil
      # gtk_layout_manager_allocate: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_layout_manager_allocate(@pointer, widget, width, height, baseline)

      # Return value handling
    end

    # Retrieves a `GtkLayoutChild` instance for the `GtkLayoutManager`,
    # creating one if necessary.
    #
    # The @child widget must be a child of the widget using @manager.
    #
    # The `GtkLayoutChild` instance is owned by the `GtkLayoutManager`,
    # and is guaranteed to exist as long as @child is a child of the
    # `GtkWidget` using the given `GtkLayoutManager`.
    def layout_child(child : Gtk::Widget) : Gtk::LayoutChild
      # gtk_layout_manager_get_layout_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_layout_manager_get_layout_child(@pointer, child)

      # Return value handling

      Gtk::LayoutChild.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the request mode of @manager.
    def request_mode : Gtk::SizeRequestMode
      # gtk_layout_manager_get_request_mode: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_layout_manager_get_request_mode(@pointer)

      # Return value handling

      Gtk::SizeRequestMode.new(_retval)
    end

    # Retrieves the `GtkWidget` using the given `GtkLayoutManager`.
    def widget : Gtk::Widget?
      # gtk_layout_manager_get_widget: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_layout_manager_get_widget(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Queues a resize on the `GtkWidget` using @manager, if any.
    #
    # This function should be called by subclasses of `GtkLayoutManager`
    # in response to changes to their layout management policies.
    def layout_changed : Nil
      # gtk_layout_manager_layout_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_layout_manager_layout_changed(@pointer)

      # Return value handling
    end

    # Measures the size of the @widget using @manager, for the
    # given @orientation and size.
    #
    # See the `Gtk#Widget` documentation on layout management for
    # more details.
    def measure(widget : Gtk::Widget, orientation : Gtk::Orientation, for_size : Int32) : Nil
      # gtk_layout_manager_measure: (Method)
      # @minimum: (out) (transfer full) (optional)
      # @natural: (out) (transfer full) (optional)
      # @minimum_baseline: (out) (transfer full) (optional)
      # @natural_baseline: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      minimum = Pointer(Int32).null          # Generator::OutArgUsedInReturnPlan
      natural = Pointer(Int32).null          # Generator::OutArgUsedInReturnPlan
      minimum_baseline = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      natural_baseline = Pointer(Int32).null
      # C call
      LibGtk.gtk_layout_manager_measure(@pointer, widget, orientation, for_size, minimum, natural, minimum_baseline, natural_baseline)

      # Return value handling
    end
  end
end
