module Gtk
  # `GtkScrollable` is an interface for widgets with native scrolling ability.
  #
  # To implement this interface you should override the
  # [property@Gtk.Scrollable:hadjustment] and
  # [property@Gtk.Scrollable:vadjustment] properties.
  #
  # ## Creating a scrollable widget
  #
  # All scrollable widgets should do the following.
  #
  # - When a parent widget sets the scrollable child widget’s adjustments,
  #   the widget should populate the adjustments’
  #   [property@Gtk.Adjustment:lower],
  #   [property@Gtk.Adjustment:upper],
  #   [property@Gtk.Adjustment:step-increment],
  #   [property@Gtk.Adjustment:page-increment] and
  #   [property@Gtk.Adjustment:page-size] properties and connect to the
  #   [signal@Gtk.Adjustment::value-changed] signal.
  #
  # - Because its preferred size is the size for a fully expanded widget,
  #   the scrollable widget must be able to cope with underallocations.
  #   This means that it must accept any value passed to its
  #   [vfunc@Gtk.Widget.size_allocate] implementation.
  #
  # - When the parent allocates space to the scrollable child widget,
  #   the widget should update the adjustments’ properties with new values.
  #
  # - When any of the adjustments emits the [signal@Gtk.Adjustment::value-changed]
  #   signal, the scrollable widget should scroll its contents.
  module Scrollable
    def border : Gtk::Border
      # gtk_scrollable_get_border: (Method)
      # @border: (out) (caller-allocates)
      # Returns: (transfer none)

      border = Gtk::Border.new

      _retval = LibGtk.gtk_scrollable_get_border(self, border)
      border
    end

    def hadjustment : Gtk::Adjustment
      # gtk_scrollable_get_hadjustment: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_scrollable_get_hadjustment(self)
      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None)
    end

    def hscroll_policy : Gtk::ScrollablePolicy
      # gtk_scrollable_get_hscroll_policy: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_scrollable_get_hscroll_policy(self)
      Gtk::ScrollablePolicy.from_value(_retval)
    end

    def vadjustment : Gtk::Adjustment
      # gtk_scrollable_get_vadjustment: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_scrollable_get_vadjustment(self)
      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None)
    end

    def vscroll_policy : Gtk::ScrollablePolicy
      # gtk_scrollable_get_vscroll_policy: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_scrollable_get_vscroll_policy(self)
      Gtk::ScrollablePolicy.from_value(_retval)
    end

    def hadjustment=(hadjustment : Gtk::Adjustment?) : Nil
      # gtk_scrollable_set_hadjustment: (Method)
      # @hadjustment: (nullable)
      # Returns: (transfer none)

      hadjustment = if hadjustment.nil?
                      Pointer(Void).null
                    else
                      hadjustment.to_unsafe
                    end

      LibGtk.gtk_scrollable_set_hadjustment(self, hadjustment)
    end

    def hscroll_policy=(policy : Gtk::ScrollablePolicy) : Nil
      # gtk_scrollable_set_hscroll_policy: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_scrollable_set_hscroll_policy(self, policy)
    end

    def vadjustment=(vadjustment : Gtk::Adjustment?) : Nil
      # gtk_scrollable_set_vadjustment: (Method)
      # @vadjustment: (nullable)
      # Returns: (transfer none)

      vadjustment = if vadjustment.nil?
                      Pointer(Void).null
                    else
                      vadjustment.to_unsafe
                    end

      LibGtk.gtk_scrollable_set_vadjustment(self, vadjustment)
    end

    def vscroll_policy=(policy : Gtk::ScrollablePolicy) : Nil
      # gtk_scrollable_set_vscroll_policy: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_scrollable_set_vscroll_policy(self, policy)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Scrollable__Impl
    include Scrollable

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
      LibGtk.gtk_scrollable_get_type
    end

    # Cast a `GObject::Object` to `Scrollable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Scrollable")
    end

    # Cast a `GObject::Object` to `Scrollable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
