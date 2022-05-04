require "../g_object-2.0/object"
require "./buildable"

module Gtk
  # `GtkSizeGroup` groups widgets together so they all request the same size.
  #
  # This is typically useful when you want a column of widgets to have the
  # same size, but you can’t use a `GtkGrid`.
  #
  # In detail, the size requested for each widget in a `GtkSizeGroup` is
  # the maximum of the sizes that would have been requested for each
  # widget in the size group if they were not in the size group. The mode
  # of the size group (see `Gtk::SizeGroup#mode=`) determines whether
  # this applies to the horizontal size, the vertical size, or both sizes.
  #
  # Note that size groups only affect the amount of space requested, not
  # the size that the widgets finally receive. If you want the widgets in
  # a `GtkSizeGroup` to actually be the same size, you need to pack them in
  # such a way that they get the size they request and not more.
  #
  # `GtkSizeGroup` objects are referenced by each widget in the size group,
  # so once you have added all widgets to a `GtkSizeGroup`, you can drop
  # the initial reference to the size group with g_object_unref(). If the
  # widgets in the size group are subsequently destroyed, then they will
  # be removed from the size group and drop their references on the size
  # group; when all widgets have been removed, the size group will be
  # freed.
  #
  # Widgets can be part of multiple size groups; GTK will compute the
  # horizontal size of a widget from the horizontal requisition of all
  # widgets that can be reached from the widget by a chain of size groups
  # of type %GTK_SIZE_GROUP_HORIZONTAL or %GTK_SIZE_GROUP_BOTH, and the
  # vertical size from the vertical requisition of all widgets that can be
  # reached from the widget by a chain of size groups of type
  # %GTK_SIZE_GROUP_VERTICAL or %GTK_SIZE_GROUP_BOTH.
  #
  # Note that only non-contextual sizes of every widget are ever consulted
  # by size groups (since size groups have no knowledge of what size a widget
  # will be allocated in one dimension, it cannot derive how much height
  # a widget will receive for a given width). When grouping widgets that
  # trade height for width in mode %GTK_SIZE_GROUP_VERTICAL or %GTK_SIZE_GROUP_BOTH:
  # the height for the minimum width will be the requested height for all
  # widgets in the group. The same is of course true when horizontally grouping
  # width for height widgets.
  #
  # Widgets that trade height-for-width should set a reasonably large minimum
  # width by way of [property@Gtk.Label:width-chars] for instance. Widgets with
  # static sizes as well as widgets that grow (such as ellipsizing text) need no
  # such considerations.
  #
  # # GtkSizeGroup as GtkBuildable
  #
  # Size groups can be specified in a UI definition by placing an <object>
  # element with `class="GtkSizeGroup"` somewhere in the UI definition. The
  # widgets that belong to the size group are specified by a <widgets> element
  # that may contain multiple <widget> elements, one for each member of the
  # size group. The ”name” attribute gives the id of the widget.
  #
  # An example of a UI definition fragment with `GtkSizeGroup`:
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <object class="GtkSizeGroup">
  #   <property name="mode">horizontal</property>
  #   <widgets>
  #     <widget name="radio1"/>
  #     <widget name="radio2"/>
  #   </widgets>
  # </object>
  # ```
  @[GObject::GeneratedWrapper]
  class SizeGroup < GObject::Object
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::SizeGroup), instance_init, 0)
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

    def initialize(*, mode : Gtk::SizeGroupMode? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !mode.nil?
        (_names.to_unsafe + _n).value = "mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mode)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SizeGroup.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_size_group_get_type
    end

    def mode=(value : Gtk::SizeGroupMode) : Gtk::SizeGroupMode
      unsafe_value = value

      LibGObject.g_object_set(self, "mode", unsafe_value, Pointer(Void).null)
      value
    end

    def mode : Gtk::SizeGroupMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "mode", pointerof(value), Pointer(Void).null)
      Gtk::SizeGroupMode.new(value)
    end

    # Create a new `GtkSizeGroup`.
    def initialize(mode : Gtk::SizeGroupMode)
      # gtk_size_group_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_size_group_new(mode)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Adds a widget to a `GtkSizeGroup`.
    #
    # In the future, the requisition
    # of the widget will be determined as the maximum of its requisition
    # and the requisition of the other widgets in the size group.
    # Whether this applies horizontally, vertically, or in both directions
    # depends on the mode of the size group.
    # See `Gtk::SizeGroup#mode=`.
    #
    # When the widget is destroyed or no longer referenced elsewhere, it
    # will be removed from the size group.
    def add_widget(widget : Gtk::Widget) : Nil
      # gtk_size_group_add_widget: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_size_group_add_widget(self, widget)

      # Return value handling
    end

    # Gets the current mode of the size group.
    def mode : Gtk::SizeGroupMode
      # gtk_size_group_get_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_size_group_get_mode(self)

      # Return value handling

      Gtk::SizeGroupMode.new(_retval)
    end

    # Returns the list of widgets associated with @size_group.
    def widgets : GLib::SList
      # gtk_size_group_get_widgets: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_size_group_get_widgets(self)

      # Return value handling

      GLib::SList(Gtk::Widget).new(_retval, GICrystal::Transfer::None)
    end

    # Removes a widget from a `GtkSizeGroup`.
    def remove_widget(widget : Gtk::Widget) : Nil
      # gtk_size_group_remove_widget: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_size_group_remove_widget(self, widget)

      # Return value handling
    end

    # Sets the `GtkSizeGroupMode` of the size group.
    #
    # The mode of the size group determines whether the widgets in the
    # size group should all have the same horizontal requisition
    # (%GTK_SIZE_GROUP_HORIZONTAL) all have the same vertical requisition
    # (%GTK_SIZE_GROUP_VERTICAL), or should all have the same requisition
    # in both directions (%GTK_SIZE_GROUP_BOTH).
    def mode=(mode : Gtk::SizeGroupMode) : Nil
      # gtk_size_group_set_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_size_group_set_mode(self, mode)

      # Return value handling
    end
  end
end
