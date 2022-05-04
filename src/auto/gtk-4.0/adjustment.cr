require "../g_object-2.0/initially_unowned"

module Gtk
  # `GtkAdjustment` is a model for a numeric value.
  #
  # The `GtkAdjustment has an associated lower and upper bound.
  # It also contains step and page increments, and a page size.
  #
  # Adjustments are used within several GTK widgets, including
  # `Gtk#SpinButton`, `Gtk#Viewport`, `Gtk#Scrollbar`
  # and `Gtk#Scale`.
  #
  # The `GtkAdjustment` object does not update the value itself. Instead
  # it is left up to the owner of the `GtkAdjustment` to control the value.
  @[GObject::GeneratedWrapper]
  class Adjustment < GObject::InitiallyUnowned
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::AdjustmentClass), class_init,
        sizeof(LibGtk::Adjustment), instance_init, 0)
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

    def initialize(*, lower : Float64? = nil, page_increment : Float64? = nil, page_size : Float64? = nil, step_increment : Float64? = nil, upper : Float64? = nil, value : Float64? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if !lower.nil?
        (_names.to_unsafe + _n).value = "lower".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, lower)
        _n += 1
      end
      if !page_increment.nil?
        (_names.to_unsafe + _n).value = "page-increment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, page_increment)
        _n += 1
      end
      if !page_size.nil?
        (_names.to_unsafe + _n).value = "page-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, page_size)
        _n += 1
      end
      if !step_increment.nil?
        (_names.to_unsafe + _n).value = "step-increment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, step_increment)
        _n += 1
      end
      if !upper.nil?
        (_names.to_unsafe + _n).value = "upper".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, upper)
        _n += 1
      end
      if !value.nil?
        (_names.to_unsafe + _n).value = "value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Adjustment.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates a new `GtkAdjustment`.
    def initialize(value : Float64, lower : Float64, upper : Float64, step_increment : Float64, page_increment : Float64, page_size : Float64)
      # gtk_adjustment_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_adjustment_new(value, lower, upper, step_increment, page_increment, page_size)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Updates the value property to ensure that the range
    # between @lower and @upper is in the current page.
    #
    # The current page goes from `value` to `value` + `page-size`.
    # If the range is larger than the page size, then only the
    # start of it will be in the current page.
    #
    # A [signal@Gtk.Adjustment::value-changed] signal will be emitted
    # if the value is changed.
    def clamp_page(lower : Float64, upper : Float64) : Nil
      # gtk_adjustment_clamp_page: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_adjustment_clamp_page(self, lower, upper)

      # Return value handling
    end

    # Sets all properties of the adjustment at once.
    #
    # Use this function to avoid multiple emissions of the
    # `Gtk::Adjustment::#changed` signal. See
    # `Gtk::Adjustment#lower=` for an alternative
    # way of compressing multiple emissions of
    # `Gtk::Adjustment::#changed` into one.
    def configure(value : Float64, lower : Float64, upper : Float64, step_increment : Float64, page_increment : Float64, page_size : Float64) : Nil
      # gtk_adjustment_configure: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_adjustment_configure(self, value, lower, upper, step_increment, page_increment, page_size)

      # Return value handling
    end

    # Retrieves the minimum value of the adjustment.
    def lower : Float64
      # gtk_adjustment_get_lower: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_adjustment_get_lower(self)

      # Return value handling

      _retval
    end

    # Gets the smaller of step increment and page increment.
    def minimum_increment : Float64
      # gtk_adjustment_get_minimum_increment: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_adjustment_get_minimum_increment(self)

      # Return value handling

      _retval
    end

    # Retrieves the page increment of the adjustment.
    def page_increment : Float64
      # gtk_adjustment_get_page_increment: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_adjustment_get_page_increment(self)

      # Return value handling

      _retval
    end

    # Retrieves the page size of the adjustment.
    def page_size : Float64
      # gtk_adjustment_get_page_size: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_adjustment_get_page_size(self)

      # Return value handling

      _retval
    end

    # Retrieves the step increment of the adjustment.
    def step_increment : Float64
      # gtk_adjustment_get_step_increment: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_adjustment_get_step_increment(self)

      # Return value handling

      _retval
    end

    # Retrieves the maximum value of the adjustment.
    def upper : Float64
      # gtk_adjustment_get_upper: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_adjustment_get_upper(self)

      # Return value handling

      _retval
    end

    # Gets the current value of the adjustment.
    def value : Float64
      # gtk_adjustment_get_value: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_adjustment_get_value(self)

      # Return value handling

      _retval
    end

    # Sets the minimum value of the adjustment.
    #
    # When setting multiple adjustment properties via their individual
    # setters, multiple `Gtk::Adjustment::#changed` signals will
    # be emitted. However, since the emission of the
    # `Gtk::Adjustment::#changed` signal is tied to the emission
    # of the ::notify signals of the changed properties, it’s possible
    # to compress the `Gtk::Adjustment::#changed` signals into one
    # by calling g_object_freeze_notify() and g_object_thaw_notify()
    # around the calls to the individual setters.
    #
    # Alternatively, using a single g_object_set() for all the properties
    # to change, or using `Gtk::Adjustment#configure` has the same effect.
    def lower=(lower : Float64) : Nil
      # gtk_adjustment_set_lower: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_adjustment_set_lower(self, lower)

      # Return value handling
    end

    # Sets the page increment of the adjustment.
    #
    # See `Gtk::Adjustment#lower=` about how to compress
    # multiple emissions of the `Gtk::Adjustment::#changed`
    # signal when setting multiple adjustment properties.
    def page_increment=(page_increment : Float64) : Nil
      # gtk_adjustment_set_page_increment: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_adjustment_set_page_increment(self, page_increment)

      # Return value handling
    end

    # Sets the page size of the adjustment.
    #
    # See `Gtk::Adjustment#lower=` about how to compress
    # multiple emissions of the `Gtk::Adjustment::#changed`
    # signal when setting multiple adjustment properties.
    def page_size=(page_size : Float64) : Nil
      # gtk_adjustment_set_page_size: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_adjustment_set_page_size(self, page_size)

      # Return value handling
    end

    # Sets the step increment of the adjustment.
    #
    # See `Gtk::Adjustment#lower=` about how to compress
    # multiple emissions of the `Gtk::Adjustment::#changed`
    # signal when setting multiple adjustment properties.
    def step_increment=(step_increment : Float64) : Nil
      # gtk_adjustment_set_step_increment: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_adjustment_set_step_increment(self, step_increment)

      # Return value handling
    end

    # Sets the maximum value of the adjustment.
    #
    # Note that values will be restricted by `upper - page-size`
    # if the page-size property is nonzero.
    #
    # See `Gtk::Adjustment#lower=` about how to compress
    # multiple emissions of the `Gtk::Adjustment::#changed`
    # signal when setting multiple adjustment properties.
    def upper=(upper : Float64) : Nil
      # gtk_adjustment_set_upper: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_adjustment_set_upper(self, upper)

      # Return value handling
    end

    # Sets the `GtkAdjustment` value.
    #
    # The value is clamped to lie between `Gtk::Adjustment#lower`
    # and `Gtk::Adjustment#upper`.
    #
    # Note that for adjustments which are used in a `GtkScrollbar`,
    # the effective range of allowed values goes from
    # `Gtk::Adjustment#lower` to
    # `Gtk::Adjustment#upper` - [property@Gtk.Adjustment:page-size].
    def value=(value : Float64) : Nil
      # gtk_adjustment_set_value: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_adjustment_set_value(self, value)

      # Return value handling
    end

    # Emitted when one or more of the `GtkAdjustment` properties have been
    # changed.
    #
    # Note that the `Gtk::Adjustment#value` property is
    # covered by the [signal@Gtk.Adjustment::value-changed] signal.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::Adjustment, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Adjustment.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Adjustment, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Adjustment, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Adjustment.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Adjustment, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end

    # Emitted when the value has been changed.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::Adjustment, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Adjustment.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Adjustment, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Adjustment, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Adjustment.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Adjustment, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
