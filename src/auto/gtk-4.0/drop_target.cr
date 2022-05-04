require "./event_controller"

module Gtk
  # `GtkDropTarget` is an event controller to receive Drag-and-Drop operations.
  #
  # The most basic way to use a `GtkDropTarget` to receive drops on a
  # widget is to create it via `Gtk::DropTarget.new`, passing in the
  # `GType` of the data you want to receive and connect to the
  # `Gtk::DropTarget::#drop` signal to receive the data:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static gboolean
  # on_drop (GtkDropTarget *target,
  #          const GValue  *value,
  #          double         x,
  #          double         y,
  #          gpointer       data)
  # {
  #   MyWidget *self = data;
  #
  #   // Call the appropriate setter depending on the type of data
  #   // that we received
  #   if (G_VALUE_HOLDS (value, G_TYPE_FILE))
  #     my_widget_set_file (self, g_value_get_object (value));
  #   else if (G_VALUE_HOLDS (value, GDK_TYPE_PIXBUF))
  #     my_widget_set_pixbuf (self, g_value_get_object (value));
  #   else
  #     return FALSE;
  #
  #   return TRUE;
  # }
  #
  # static void
  # my_widget_init (MyWidget *self)
  # {
  #   GtkDropTarget *target =
  #     gtk_drop_target_new (G_TYPE_INVALID, GDK_ACTION_COPY);
  #
  #   // This widget accepts two types of drop types: GFile objects
  #   // and GdkPixbuf objects
  #   gtk_drop_target_set_gtypes (target, (GTypes [2]) {
  #     G_TYPE_FILE,
  #     GDK_TYPE_PIXBUF,
  #   }, 2);
  #
  #   g_signal_connect (target, "drop", G_CALLBACK (on_drop), self);
  #   gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER (target));
  # }
  # ```
  #
  # `GtkDropTarget` supports more options, such as:
  #
  #  * rejecting potential drops via the `Gtk::DropTarget::#accept` signal
  #    and the `Gtk::DropTarget#reject` function to let other drop
  #    targets handle the drop
  #  * tracking an ongoing drag operation before the drop via the
  #    `Gtk::DropTarget::#enter`, `Gtk::DropTarget::#motion` and
  #    `Gtk::DropTarget::#leave` signals
  #  * configuring how to receive data by setting the
  #    `Gtk::DropTarget#preload` property and listening for its
  #    availability via the `Gtk::DropTarget#value` property
  #
  # However, `GtkDropTarget` is ultimately modeled in a synchronous way
  # and only supports data transferred via `GType`. If you want full control
  # over an ongoing drop, the `Gtk#DropTargetAsync` object gives you
  # this ability.
  #
  # While a pointer is dragged over the drop target's widget and the drop
  # has not been rejected, that widget will receive the
  # %GTK_STATE_FLAG_DROP_ACTIVE state, which can be used to style the widget.
  #
  # If you are not interested in receiving the drop, but just want to update
  # UI state during a Drag-and-Drop operation (e.g. switching tabs), you can
  # use `Gtk#DropControllerMotion`.
  @[GObject::GeneratedWrapper]
  class DropTarget < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::DropTargetClass), class_init,
        sizeof(LibGtk::DropTarget), instance_init, 0)
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

    def initialize(*, actions : Gdk::DragAction? = nil, current_drop : Gdk::Drop? = nil, formats : Gdk::ContentFormats? = nil, name : ::String? = nil, preload : Bool? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, value : GObject::Value? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if !actions.nil?
        (_names.to_unsafe + _n).value = "actions".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, actions)
        _n += 1
      end
      if !current_drop.nil?
        (_names.to_unsafe + _n).value = "current-drop".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, current_drop)
        _n += 1
      end
      if !formats.nil?
        (_names.to_unsafe + _n).value = "formats".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, formats)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !preload.nil?
        (_names.to_unsafe + _n).value = "preload".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, preload)
        _n += 1
      end
      if !propagation_limit.nil?
        (_names.to_unsafe + _n).value = "propagation-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_limit)
        _n += 1
      end
      if !propagation_phase.nil?
        (_names.to_unsafe + _n).value = "propagation-phase".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_phase)
        _n += 1
      end
      if !value.nil?
        (_names.to_unsafe + _n).value = "value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value)
        _n += 1
      end
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DropTarget.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_drop_target_get_type
    end

    def actions=(value : Gdk::DragAction) : Gdk::DragAction
      unsafe_value = value

      LibGObject.g_object_set(self, "actions", unsafe_value, Pointer(Void).null)
      value
    end

    def actions : Gdk::DragAction
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "actions", pointerof(value), Pointer(Void).null)
      Gdk::DragAction.new(value)
    end

    def current_drop : Gdk::Drop?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "current-drop", pointerof(value), Pointer(Void).null)
      Gdk::Drop.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def formats=(value : Gdk::ContentFormats?) : Gdk::ContentFormats?
      unsafe_value = value

      LibGObject.g_object_set(self, "formats", unsafe_value, Pointer(Void).null)
      value
    end

    def formats : Gdk::ContentFormats?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "formats", pointerof(value), Pointer(Void).null)
      Gdk::ContentFormats.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def preload=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "preload", unsafe_value, Pointer(Void).null)
      value
    end

    def preload? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "preload", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def value : GObject::Value?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "value", pointerof(value), Pointer(Void).null)
      GObject::Value.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new `GtkDropTarget` object.
    #
    # If the drop target should support more than 1 type, pass
    # %G_TYPE_INVALID for @type and then call
    # `Gtk::DropTarget#gtypes=`.
    def initialize(type : UInt64, actions : Gdk::DragAction)
      # gtk_drop_target_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_drop_target_new(type, actions)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the actions that this drop target supports.
    def actions : Gdk::DragAction
      # gtk_drop_target_get_actions: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_target_get_actions(self)

      # Return value handling

      Gdk::DragAction.new(_retval)
    end

    # Gets the currently handled drop operation.
    #
    # If no drop operation is going on, %NULL is returned.
    def current_drop : Gdk::Drop?
      # gtk_drop_target_get_current_drop: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_target_get_current_drop(self)

      # Return value handling

      Gdk::Drop.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the currently handled drop operation.
    #
    # If no drop operation is going on, %NULL is returned.
    def drop : Gdk::Drop?
      # gtk_drop_target_get_drop: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_target_get_drop(self)

      # Return value handling

      Gdk::Drop.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the data formats that this drop target accepts.
    #
    # If the result is %NULL, all formats are expected to be supported.
    def formats : Gdk::ContentFormats?
      # gtk_drop_target_get_formats: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_target_get_formats(self)

      # Return value handling

      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the list of supported `GType`s that can be dropped on the target.
    #
    # If no types have been set, `NULL` will be returned.
    def gtypes : Enumerable(UInt64)?
      # gtk_drop_target_get_gtypes: (Method)
      # @n_types: (out) (transfer full) (optional)
      # Returns: (transfer none) (array length=n_types element-type Gtype)

      # Generator::OutArgUsedInReturnPlan
      n_types = 0_u64
      # C call
      _retval = LibGtk.gtk_drop_target_get_gtypes(self, pointerof(n_types))

      # Return value handling

      GICrystal.transfer_array(_retval, n_types, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether data should be preloaded on hover.
    def preload : Bool
      # gtk_drop_target_get_preload: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_target_get_preload(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the current drop data, as a `GValue`.
    def value : GObject::Value?
      # gtk_drop_target_get_value: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_target_get_value(self)

      # Return value handling

      GObject::Value.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Rejects the ongoing drop operation.
    #
    # If no drop operation is ongoing, i.e when [property@Gtk.DropTarget:current-drop]
    # is %NULL, this function does nothing.
    #
    # This function should be used when delaying the decision
    # on whether to accept a drag or not until after reading
    # the data.
    def reject : Nil
      # gtk_drop_target_reject: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_drop_target_reject(self)

      # Return value handling
    end

    # Sets the actions that this drop target supports.
    def actions=(actions : Gdk::DragAction) : Nil
      # gtk_drop_target_set_actions: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_drop_target_set_actions(self, actions)

      # Return value handling
    end

    # Sets the supported `GTypes` for this drop target.
    def gtypes=(types : Enumerable(UInt64)?) : Nil
      # gtk_drop_target_set_gtypes: (Method)
      # @types: (nullable) (array length=n_types element-type Gtype)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_types = types.try(&.size) || 0 # Generator::NullableArrayPlan
      types = if types.nil?
                Pointer(UInt64).null
              else
                types.to_a.to_unsafe
              end

      # C call
      LibGtk.gtk_drop_target_set_gtypes(self, types, n_types)

      # Return value handling
    end

    # Sets whether data should be preloaded on hover.
    def preload=(preload : Bool) : Nil
      # gtk_drop_target_set_preload: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_drop_target_set_preload(self, preload)

      # Return value handling
    end

    # Emitted on the drop site when a drop operation is about to begin.
    #
    # If the drop is not accepted, %FALSE will be returned and the drop target
    # will ignore the drop. If %TRUE is returned, the drop is accepted for now
    # but may be rejected later via a call to `Gtk::DropTarget#reject`
    # or ultimately by returning %FALSE from a `Gtk::DropTarget::#drop`
    # handler.
    #
    # The default handler for this signal decides whether to accept the drop
    # based on the formats provided by the @drop.
    #
    # If the decision whether the drop will be accepted or rejected depends
    # on the data, this function should return %TRUE, the
    # `Gtk::DropTarget#preload` property should be set and the value
    # should be inspected via the ::notify:value signal, calling
    # `Gtk::DropTarget#reject` if required.
    struct AcceptSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "accept::#{@detail}" : "accept"
      end

      def connect(&block : Proc(Gdk::Drop, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Drop, Bool))
        connect(block)
      end

      def connect(handler : Proc(Gdk::Drop, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drop : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          drop = Gdk::Drop.new(lib_drop, :none)
          ::Box(Proc(Gdk::Drop, Bool)).unbox(_lib_box).call(drop)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::Drop, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drop : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          drop = Gdk::Drop.new(lib_drop, :none)
          ::Box(Proc(Gdk::Drop, Bool)).unbox(_lib_box).call(drop)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::DropTarget, Gdk::Drop, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drop : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTarget.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          drop = Gdk::Drop.new(lib_drop, :none)
          ::Box(Proc(Gtk::DropTarget, Gdk::Drop, Bool)).unbox(_lib_box).call(_sender, drop)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::DropTarget, Gdk::Drop, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drop : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTarget.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          drop = Gdk::Drop.new(lib_drop, :none)
          ::Box(Proc(Gtk::DropTarget, Gdk::Drop, Bool)).unbox(_lib_box).call(_sender, drop)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(drop : Gdk::Drop) : Nil
        LibGObject.g_signal_emit_by_name(@source, "accept", drop)
      end
    end

    def accept_signal
      AcceptSignal.new(self)
    end

    # Emitted on the drop site when the user drops the data onto the widget.
    #
    # The signal handler must determine whether the pointer position is in
    # a drop zone or not. If it is not in a drop zone, it returns %FALSE
    # and no further processing is necessary.
    #
    # Otherwise, the handler returns %TRUE. In this case, this handler will
    # accept the drop. The handler is responsible for using the given @value
    # and performing the drop operation.
    struct DropSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drop::#{@detail}" : "drop"
      end

      def connect(&block : Proc(GObject::Value, Float64, Float64, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(GObject::Value, Float64, Float64, Bool))
        connect(block)
      end

      def connect(handler : Proc(GObject::Value, Float64, Float64, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          # Generator::HandmadeArgPlan
          value = GObject::Value.new(lib_value, :none)
          # Generator::GObjectArgPlan
          value = GObject::Value.new(lib_value, :none)
          x = lib_x
          y = lib_y
          ::Box(Proc(GObject::Value, Float64, Float64, Bool)).unbox(_lib_box).call(value, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(GObject::Value, Float64, Float64, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          # Generator::HandmadeArgPlan
          value = GObject::Value.new(lib_value, :none)
          # Generator::GObjectArgPlan
          value = GObject::Value.new(lib_value, :none)
          x = lib_x
          y = lib_y
          ::Box(Proc(GObject::Value, Float64, Float64, Bool)).unbox(_lib_box).call(value, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::DropTarget, GObject::Value, Float64, Float64, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTarget.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::HandmadeArgPlan
          value = GObject::Value.new(lib_value, :none)
          # Generator::GObjectArgPlan
          value = GObject::Value.new(lib_value, :none)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::DropTarget, GObject::Value, Float64, Float64, Bool)).unbox(_lib_box).call(_sender, value, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::DropTarget, GObject::Value, Float64, Float64, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTarget.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::HandmadeArgPlan
          value = GObject::Value.new(lib_value, :none)
          # Generator::GObjectArgPlan
          value = GObject::Value.new(lib_value, :none)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::DropTarget, GObject::Value, Float64, Float64, Bool)).unbox(_lib_box).call(_sender, value, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(value : _, x : Float64, y : Float64) : Nil
        value = GObject::Value.new(value) unless value.is_a?(GObject::Value)
        LibGObject.g_signal_emit_by_name(@source, "drop", value, x, y)
      end
    end

    def drop_signal
      DropSignal.new(self)
    end

    # Emitted on the drop site when the pointer enters the widget.
    #
    # It can be used to set up custom highlighting.
    struct EnterSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "enter::#{@detail}" : "enter"
      end

      def connect(&block : Proc(Float64, Float64, Gdk::DragAction))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Gdk::DragAction))
        connect(block)
      end

      def connect(handler : Proc(Float64, Float64, Gdk::DragAction))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Gdk::DragAction)).unbox(_lib_box).call(x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Float64, Gdk::DragAction))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Gdk::DragAction)).unbox(_lib_box).call(x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTarget.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTarget.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "enter", x, y)
      end
    end

    def enter_signal
      EnterSignal.new(self)
    end

    # Emitted on the drop site when the pointer leaves the widget.
    #
    # Its main purpose it to undo things done in
    # `Gtk::DropTarget::#enter`.
    struct LeaveSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "leave::#{@detail}" : "leave"
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

      def connect(handler : Proc(Gtk::DropTarget, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTarget.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DropTarget, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::DropTarget, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTarget.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DropTarget, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "leave")
      end
    end

    def leave_signal
      LeaveSignal.new(self)
    end

    # Emitted while the pointer is moving over the drop target.
    struct MotionSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "motion::#{@detail}" : "motion"
      end

      def connect(&block : Proc(Float64, Float64, Gdk::DragAction))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Gdk::DragAction))
        connect(block)
      end

      def connect(handler : Proc(Float64, Float64, Gdk::DragAction))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Gdk::DragAction)).unbox(_lib_box).call(x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Float64, Gdk::DragAction))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Gdk::DragAction)).unbox(_lib_box).call(x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTarget.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::DropTarget.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "motion", x, y)
      end
    end

    def motion_signal
      MotionSignal.new(self)
    end
  end
end
