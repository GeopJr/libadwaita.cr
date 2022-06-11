require "../g_object-2.0/object"
require "../gdk-4.0/paintable"

module Gtk
  # `GtkWidgetPaintable` is a `GdkPaintable` that displays the contents
  # of a widget.
  #
  # `GtkWidgetPaintable` will also take care of the widget not being in a
  # state where it can be drawn (like when it isn't shown) and just draw
  # nothing or where it does not have a size (like when it is hidden) and
  # report no size in that case.
  #
  # Of course, `GtkWidgetPaintable` allows you to monitor widgets for size
  # changes by emitting the [signal@Gdk.Paintable::invalidate-size] signal
  # whenever the size of the widget changes as well as for visual changes by
  # emitting the [signal@Gdk.Paintable::invalidate-contents] signal whenever
  # the widget changes.
  #
  # You can use a `GtkWidgetPaintable` everywhere a `GdkPaintable` is allowed,
  # including using it on a `GtkPicture` (or one of its parents) that it was
  # set on itself via gtk_picture_set_paintable(). The paintable will take care
  # of recursion when this happens. If you do this however, ensure that the
  # [property@Gtk.Picture:can-shrink] property is set to %TRUE or you might
  # end up with an infinitely growing widget.
  @[GObject::GeneratedWrapper]
  class WidgetPaintable < GObject::Object
    include Gdk::Paintable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::WidgetPaintableClass), class_init,
        sizeof(LibGtk::WidgetPaintable), instance_init, 0)
    end

    GICrystal.define_new_method(WidgetPaintable, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `WidgetPaintable`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(WidgetPaintable.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_widget_paintable_get_type
    end

    def widget=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "widget", unsafe_value, Pointer(Void).null)
      value
    end

    def widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new widget paintable observing the given widget.
    def self.new(widget : Gtk::Widget?) : self
      # gtk_widget_paintable_new: (Constructor)
      # @widget: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      _retval = LibGtk.gtk_widget_paintable_new(widget)

      # Return value handling

      Gtk::WidgetPaintable.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns the widget that is observed or %NULL if none.
    def widget : Gtk::Widget?
      # gtk_widget_paintable_get_widget: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_paintable_get_widget(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets the widget that should be observed.
    def widget=(widget : Gtk::Widget?) : Nil
      # gtk_widget_paintable_set_widget: (Method | Setter)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibGtk.gtk_widget_paintable_set_widget(@pointer, widget)

      # Return value handling
    end
  end
end
