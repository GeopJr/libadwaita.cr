module Gtk
  # `GtkScrollable` is an interface for widgets with native scrolling ability.
  #
  # To implement this interface you should override the
  # `Gtk::Scrollable#hadjustment` and
  # `Gtk::Scrollable#vadjustment` properties.
  #
  # ## Creating a scrollable widget
  #
  # All scrollable widgets should do the following.
  #
  # - When a parent widget sets the scrollable child widget’s adjustments,
  #   the widget should populate the adjustments’
  #   `Gtk::Adjustment#lower`,
  #   `Gtk::Adjustment#upper`,
  #   [property@Gtk.Adjustment:step-increment],
  #   [property@Gtk.Adjustment:page-increment] and
  #   [property@Gtk.Adjustment:page-size] properties and connect to the
  #   [signal@Gtk.Adjustment::value-changed] signal.
  #
  # - Because its preferred size is the size for a fully expanded widget,
  #   the scrollable widget must be able to cope with underallocations.
  #   This means that it must accept any value passed to its
  #   `Gtk::Widget#size_allocate` implementation.
  #
  # - When the parent allocates space to the scrollable child widget,
  #   the widget should update the adjustments’ properties with new values.
  #
  # - When any of the adjustments emits the [signal@Gtk.Adjustment::value-changed]
  #   signal, the scrollable widget should scroll its contents.
  module Scrollable
    def hadjustment=(value : Gtk::Adjustment?) : Gtk::Adjustment?
      unsafe_value = value

      LibGObject.g_object_set(self, "hadjustment", unsafe_value, Pointer(Void).null)
      value
    end

    def hadjustment : Gtk::Adjustment?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "hadjustment", pointerof(value), Pointer(Void).null)
      Gtk::Adjustment.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def hscroll_policy=(value : Gtk::ScrollablePolicy) : Gtk::ScrollablePolicy
      unsafe_value = value

      LibGObject.g_object_set(self, "hscroll-policy", unsafe_value, Pointer(Void).null)
      value
    end

    def hscroll_policy : Gtk::ScrollablePolicy
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "hscroll-policy", pointerof(value), Pointer(Void).null)
      Gtk::ScrollablePolicy.new(value)
    end

    def vadjustment=(value : Gtk::Adjustment?) : Gtk::Adjustment?
      unsafe_value = value

      LibGObject.g_object_set(self, "vadjustment", unsafe_value, Pointer(Void).null)
      value
    end

    def vadjustment : Gtk::Adjustment?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "vadjustment", pointerof(value), Pointer(Void).null)
      Gtk::Adjustment.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def vscroll_policy=(value : Gtk::ScrollablePolicy) : Gtk::ScrollablePolicy
      unsafe_value = value

      LibGObject.g_object_set(self, "vscroll-policy", unsafe_value, Pointer(Void).null)
      value
    end

    def vscroll_policy : Gtk::ScrollablePolicy
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "vscroll-policy", pointerof(value), Pointer(Void).null)
      Gtk::ScrollablePolicy.new(value)
    end

    def border : Gtk::Border
      # gtk_scrollable_get_border: (Method)
      # @border: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      border = Gtk::Border.new

      # C call
      _retval = LibGtk.gtk_scrollable_get_border(self, border)

      # Return value handling

      border
    end

    def hadjustment : Gtk::Adjustment?
      # gtk_scrollable_get_hadjustment: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrollable_get_hadjustment(self)

      # Return value handling

      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def hscroll_policy : Gtk::ScrollablePolicy
      # gtk_scrollable_get_hscroll_policy: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrollable_get_hscroll_policy(self)

      # Return value handling

      Gtk::ScrollablePolicy.new(_retval)
    end

    def vadjustment : Gtk::Adjustment?
      # gtk_scrollable_get_vadjustment: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrollable_get_vadjustment(self)

      # Return value handling

      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def vscroll_policy : Gtk::ScrollablePolicy
      # gtk_scrollable_get_vscroll_policy: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrollable_get_vscroll_policy(self)

      # Return value handling

      Gtk::ScrollablePolicy.new(_retval)
    end

    def hadjustment=(hadjustment : Gtk::Adjustment?) : Nil
      # gtk_scrollable_set_hadjustment: (Method | Setter)
      # @hadjustment: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      hadjustment = if hadjustment.nil?
                      Pointer(Void).null
                    else
                      hadjustment.to_unsafe
                    end

      # C call
      LibGtk.gtk_scrollable_set_hadjustment(self, hadjustment)

      # Return value handling
    end

    def hscroll_policy=(policy : Gtk::ScrollablePolicy) : Nil
      # gtk_scrollable_set_hscroll_policy: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scrollable_set_hscroll_policy(self, policy)

      # Return value handling
    end

    def vadjustment=(vadjustment : Gtk::Adjustment?) : Nil
      # gtk_scrollable_set_vadjustment: (Method | Setter)
      # @vadjustment: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      vadjustment = if vadjustment.nil?
                      Pointer(Void).null
                    else
                      vadjustment.to_unsafe
                    end

      # C call
      LibGtk.gtk_scrollable_set_vadjustment(self, vadjustment)

      # Return value handling
    end

    def vscroll_policy=(policy : Gtk::ScrollablePolicy) : Nil
      # gtk_scrollable_set_vscroll_policy: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scrollable_set_vscroll_policy(self, policy)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class Scrollable__Impl < GObject::Object
    include Scrollable

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_scrollable_get_type
    end

    # Cast a `GObject::Object` to `Scrollable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Scrollable")
    end

    # Cast a `GObject::Object` to `Scrollable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
