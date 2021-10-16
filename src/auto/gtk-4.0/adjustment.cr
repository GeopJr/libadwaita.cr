require "../g_object-2.0/initially_unowned"

module Gtk
  # `GtkAdjustment` is a model for a numeric value.
  #
  # The `GtkAdjustment has an associated lower and upper bound.
  # It also contains step and page increments, and a page size.
  #
  # Adjustments are used within several GTK widgets, including
  # [class@Gtk.SpinButton], [class@Gtk.Viewport], [class@Gtk.Scrollbar]
  # and [class@Gtk.Scale].
  #
  # The `GtkAdjustment` object does not update the value itself. Instead
  # it is left up to the owner of the `GtkAdjustment` to control the value.
  class Adjustment < GObject::InitiallyUnowned
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, lower : Float64? = nil, page_increment : Float64? = nil, page_size : Float64? = nil, step_increment : Float64? = nil, upper : Float64? = nil, value : Float64? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if lower
        (_names.to_unsafe + _n).value = "lower".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, lower)
        _n += 1
      end
      if page_increment
        (_names.to_unsafe + _n).value = "page-increment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, page_increment)
        _n += 1
      end
      if page_size
        (_names.to_unsafe + _n).value = "page-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, page_size)
        _n += 1
      end
      if step_increment
        (_names.to_unsafe + _n).value = "step-increment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, step_increment)
        _n += 1
      end
      if upper
        (_names.to_unsafe + _n).value = "upper".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, upper)
        _n += 1
      end
      if value
        (_names.to_unsafe + _n).value = "value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Adjustment.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_adjustment_get_type
    end

    def lower=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "lower", unsafe_value, Pointer(Void).null)
      value
    end

    def lower : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "lower", pointerof(value), Pointer(Void).null)
      value
    end

    def page_increment=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "page-increment", unsafe_value, Pointer(Void).null)
      value
    end

    def page_increment : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "page-increment", pointerof(value), Pointer(Void).null)
      value
    end

    def page_size=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "page-size", unsafe_value, Pointer(Void).null)
      value
    end

    def page_size : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "page-size", pointerof(value), Pointer(Void).null)
      value
    end

    def step_increment=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "step-increment", unsafe_value, Pointer(Void).null)
      value
    end

    def step_increment : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "step-increment", pointerof(value), Pointer(Void).null)
      value
    end

    def upper=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "upper", unsafe_value, Pointer(Void).null)
      value
    end

    def upper : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "upper", pointerof(value), Pointer(Void).null)
      value
    end

    def value=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "value", unsafe_value, Pointer(Void).null)
      value
    end

    def value : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "value", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize(value : Float64, lower : Float64, upper : Float64, step_increment : Float64, page_increment : Float64, page_size : Float64)
      # gtk_adjustment_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_adjustment_new(value, lower, upper, step_increment, page_increment, page_size)
      @pointer = _retval
    end

    def clamp_page(lower : Float64, upper : Float64) : Nil
      # gtk_adjustment_clamp_page: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_adjustment_clamp_page(self, lower, upper)
    end

    def configure(value : Float64, lower : Float64, upper : Float64, step_increment : Float64, page_increment : Float64, page_size : Float64) : Nil
      # gtk_adjustment_configure: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_adjustment_configure(self, value, lower, upper, step_increment, page_increment, page_size)
    end

    def lower : Float64
      # gtk_adjustment_get_lower: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_adjustment_get_lower(self)
      _retval
    end

    def minimum_increment : Float64
      # gtk_adjustment_get_minimum_increment: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_adjustment_get_minimum_increment(self)
      _retval
    end

    def page_increment : Float64
      # gtk_adjustment_get_page_increment: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_adjustment_get_page_increment(self)
      _retval
    end

    def page_size : Float64
      # gtk_adjustment_get_page_size: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_adjustment_get_page_size(self)
      _retval
    end

    def step_increment : Float64
      # gtk_adjustment_get_step_increment: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_adjustment_get_step_increment(self)
      _retval
    end

    def upper : Float64
      # gtk_adjustment_get_upper: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_adjustment_get_upper(self)
      _retval
    end

    def value : Float64
      # gtk_adjustment_get_value: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_adjustment_get_value(self)
      _retval
    end

    def lower=(lower : Float64) : Nil
      # gtk_adjustment_set_lower: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_adjustment_set_lower(self, lower)
    end

    def page_increment=(page_increment : Float64) : Nil
      # gtk_adjustment_set_page_increment: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_adjustment_set_page_increment(self, page_increment)
    end

    def page_size=(page_size : Float64) : Nil
      # gtk_adjustment_set_page_size: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_adjustment_set_page_size(self, page_size)
    end

    def step_increment=(step_increment : Float64) : Nil
      # gtk_adjustment_set_step_increment: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_adjustment_set_step_increment(self, step_increment)
    end

    def upper=(upper : Float64) : Nil
      # gtk_adjustment_set_upper: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_adjustment_set_upper(self, upper)
    end

    def value=(value : Float64) : Nil
      # gtk_adjustment_set_value: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_adjustment_set_value(self, value)
    end

    struct ChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "changed::#{@detail}" : "changed"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Adjustment, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Adjustment.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Adjustment, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Adjustment, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Adjustment.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Adjustment, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end

    struct ValueChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "value-changed::#{@detail}" : "value-changed"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Adjustment, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Adjustment.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Adjustment, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Adjustment, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Adjustment.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Adjustment, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "value-changed")
      end
    end

    def value_changed_signal
      ValueChangedSignal.new(self)
    end
  end
end
