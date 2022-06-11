require "./gesture_single"

module Gtk
  # `GtkDragSource` is an event controller to initiate Drag-And-Drop operations.
  #
  # `GtkDragSource` can be set up with the necessary
  # ingredients for a DND operation ahead of time. This includes
  # the source for the data that is being transferred, in the form
  # of a `Gdk#ContentProvider`, the desired action, and the icon to
  # use during the drag operation. After setting it up, the drag
  # source must be added to a widget as an event controller, using
  # `Gtk::Widget#add_controller`.
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static void
  # my_widget_init (MyWidget *self)
  # {
  #   GtkDragSource *drag_source = gtk_drag_source_new ();
  #
  #   g_signal_connect (drag_source, "prepare", G_CALLBACK (on_drag_prepare), self);
  #   g_signal_connect (drag_source, "drag-begin", G_CALLBACK (on_drag_begin), self);
  #
  #   gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER (drag_source));
  # }
  # ```
  #
  # Setting up the content provider and icon ahead of time only makes
  # sense when the data does not change. More commonly, you will want
  # to set them up just in time. To do so, `GtkDragSource` has
  # `Gtk::DragSource::#prepare` and [signal@Gtk.DragSource::drag-begin]
  # signals.
  #
  # The ::prepare signal is emitted before a drag is started, and
  # can be used to set the content provider and actions that the
  # drag should be started with.
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static GdkContentProvider *
  # on_drag_prepare (GtkDragSource *source,
  #                  double         x,
  #                  double         y,
  #                  MyWidget      *self)
  # {
  #   // This widget supports two types of content: GFile objects
  #   // and GdkPixbuf objects; GTK will handle the serialization
  #   // of these types automatically
  #   GFile *file = my_widget_get_file (self);
  #   GdkPixbuf *pixbuf = my_widget_get_pixbuf (self);
  #
  #   return gdk_content_provider_new_union ((GdkContentProvider *[2]) {
  #       gdk_content_provider_new_typed (G_TYPE_FILE, file),
  #       gdk_content_provider_new_typed (GDK_TYPE_PIXBUF, pixbuf),
  #     }, 2);
  # }
  # ```
  #
  # The ::drag-begin signal is emitted after the `GdkDrag` object has
  # been created, and can be used to set up the drag icon.
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static void
  # on_drag_begin (GtkDragSource *source,
  #                GdkDrag       *drag,
  #                MyWidget      *self)
  # {
  #   // Set the widget as the drag icon
  #   GdkPaintable *paintable = gtk_widget_paintable_new (GTK_WIDGET (self));
  #   gtk_drag_source_set_icon (source, paintable, 0, 0);
  #   g_object_unref (paintable);
  # }
  # ```
  #
  # During the DND operation, `GtkDragSource` emits signals that
  # can be used to obtain updates about the status of the operation,
  # but it is not normally necessary to connect to any signals,
  # except for one case: when the supported actions include
  # %GDK_ACTION_MOVE, you need to listen for the
  # [signal@Gtk.DragSource::drag-end] signal and delete the
  # data after it has been transferred.
  @[GObject::GeneratedWrapper]
  class DragSource < GestureSingle
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::DragSourceClass), class_init,
        sizeof(LibGtk::DragSource), instance_init, 0)
    end

    GICrystal.define_new_method(DragSource, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `DragSource`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, actions : Gdk::DragAction? = nil, button : UInt32? = nil, content : Gdk::ContentProvider? = nil, exclusive : Bool? = nil, n_points : UInt32? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, touch_only : Bool? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[10]
      _values = StaticArray(LibGObject::Value, 10).new(LibGObject::Value.new)
      _n = 0

      if !actions.nil?
        (_names.to_unsafe + _n).value = "actions".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, actions)
        _n += 1
      end
      if !button.nil?
        (_names.to_unsafe + _n).value = "button".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, button)
        _n += 1
      end
      if !content.nil?
        (_names.to_unsafe + _n).value = "content".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, content)
        _n += 1
      end
      if !exclusive.nil?
        (_names.to_unsafe + _n).value = "exclusive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, exclusive)
        _n += 1
      end
      if !n_points.nil?
        (_names.to_unsafe + _n).value = "n-points".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_points)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
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
      if !touch_only.nil?
        (_names.to_unsafe + _n).value = "touch-only".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, touch_only)
        _n += 1
      end
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DragSource.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_drag_source_get_type
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

    def content=(value : Gdk::ContentProvider?) : Gdk::ContentProvider?
      unsafe_value = value

      LibGObject.g_object_set(self, "content", unsafe_value, Pointer(Void).null)
      value
    end

    def content : Gdk::ContentProvider?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "content", pointerof(value), Pointer(Void).null)
      Gdk::ContentProvider.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Cancels a currently ongoing drag operation.
    def drag_cancel : Nil
      # gtk_drag_source_drag_cancel: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_drag_source_drag_cancel(@pointer)

      # Return value handling
    end

    # Gets the actions that are currently set on the `GtkDragSource`.
    def actions : Gdk::DragAction
      # gtk_drag_source_get_actions: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drag_source_get_actions(@pointer)

      # Return value handling

      Gdk::DragAction.new(_retval)
    end

    # Gets the current content provider of a `GtkDragSource`.
    def content : Gdk::ContentProvider?
      # gtk_drag_source_get_content: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drag_source_get_content(@pointer)

      # Return value handling

      Gdk::ContentProvider.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the underlying `GdkDrag` object for an ongoing drag.
    def drag : Gdk::Drag?
      # gtk_drag_source_get_drag: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drag_source_get_drag(@pointer)

      # Return value handling

      Gdk::Drag.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets the actions on the `GtkDragSource`.
    #
    # During a DND operation, the actions are offered to potential
    # drop targets. If @actions include %GDK_ACTION_MOVE, you need
    # to listen to the [signal@Gtk.DragSource::drag-end] signal and
    # handle @delete_data being %TRUE.
    #
    # This function can be called before a drag is started,
    # or in a handler for the `Gtk::DragSource::#prepare` signal.
    def actions=(actions : Gdk::DragAction) : Nil
      # gtk_drag_source_set_actions: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_drag_source_set_actions(@pointer, actions)

      # Return value handling
    end

    # Sets a content provider on a `GtkDragSource`.
    #
    # When the data is requested in the cause of a DND operation,
    # it will be obtained from the content provider.
    #
    # This function can be called before a drag is started,
    # or in a handler for the `Gtk::DragSource::#prepare` signal.
    #
    # You may consider setting the content provider back to
    # %NULL in a [signal@Gtk.DragSource::drag-end] signal handler.
    def content=(content : Gdk::ContentProvider?) : Nil
      # gtk_drag_source_set_content: (Method | Setter)
      # @content: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      content = if content.nil?
                  Pointer(Void).null
                else
                  content.to_unsafe
                end

      # C call
      LibGtk.gtk_drag_source_set_content(@pointer, content)

      # Return value handling
    end

    # Sets a paintable to use as icon during DND operations.
    #
    # The hotspot coordinates determine the point on the icon
    # that gets aligned with the hotspot of the cursor.
    #
    # If @paintable is %NULL, a default icon is used.
    #
    # This function can be called before a drag is started, or in
    # a `Gtk::DragSource::#prepare` or
    # [signal@Gtk.DragSource::drag-begin] signal handler.
    def set_icon(paintable : Gdk::Paintable?, hot_x : Int32, hot_y : Int32) : Nil
      # gtk_drag_source_set_icon: (Method)
      # @paintable: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      paintable = if paintable.nil?
                    Pointer(Void).null
                  else
                    paintable.to_unsafe
                  end

      # C call
      LibGtk.gtk_drag_source_set_icon(@pointer, paintable, hot_x, hot_y)

      # Return value handling
    end

    # Emitted on the drag source when a drag is started.
    #
    # It can be used to e.g. set a custom drag icon with
    # `Gtk::DragSource#icon=`.
    struct DragBeginSignal < GObject::Signal
      def name : String
        @detail ? "drag-begin::#{@detail}" : "drag-begin"
      end

      def connect(*, after : Bool = false, &block : Proc(Gdk::Drag, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gdk::Drag, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drag : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          drag = Gdk::Drag.new(lib_drag, :none)
          ::Box(Proc(Gdk::Drag, Nil)).unbox(_lib_box).call(drag)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::DragSource, Gdk::Drag, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drag : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::DragSource.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          drag = Gdk::Drag.new(lib_drag, :none)
          ::Box(Proc(Gtk::DragSource, Gdk::Drag, Nil)).unbox(_lib_box).call(_sender, drag)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(drag : Gdk::Drag) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-begin", drag)
      end
    end

    def drag_begin_signal
      DragBeginSignal.new(self)
    end

    # Emitted on the drag source when a drag has failed.
    #
    # The signal handler may handle a failed drag operation based on
    # the type of error. It should return %TRUE if the failure has been handled
    # and the default "drag operation failed" animation should not be shown.
    struct DragCancelSignal < GObject::Signal
      def name : String
        @detail ? "drag-cancel::#{@detail}" : "drag-cancel"
      end

      def connect(*, after : Bool = false, &block : Proc(Gdk::Drag, Gdk::DragCancelReason, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gdk::Drag, Gdk::DragCancelReason, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drag : Pointer(Void), lib_reason : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          drag = Gdk::Drag.new(lib_drag, :none)
          # Generator::BuiltInTypeArgPlan
          reason = Gdk::DragCancelReason.new(lib_reason)
          ::Box(Proc(Gdk::Drag, Gdk::DragCancelReason, Bool)).unbox(_lib_box).call(drag, reason)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::DragSource, Gdk::Drag, Gdk::DragCancelReason, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drag : Pointer(Void), lib_reason : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::DragSource.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          drag = Gdk::Drag.new(lib_drag, :none)
          # Generator::BuiltInTypeArgPlan
          reason = Gdk::DragCancelReason.new(lib_reason)
          ::Box(Proc(Gtk::DragSource, Gdk::Drag, Gdk::DragCancelReason, Bool)).unbox(_lib_box).call(_sender, drag, reason)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(drag : Gdk::Drag, reason : Gdk::DragCancelReason) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-cancel", drag, reason)
      end
    end

    def drag_cancel_signal
      DragCancelSignal.new(self)
    end

    # Emitted on the drag source when a drag is finished.
    #
    # A typical reason to connect to this signal is to undo
    # things done in `Gtk::DragSource::#prepare` or
    # [signal@Gtk.DragSource::drag-begin] handlers.
    struct DragEndSignal < GObject::Signal
      def name : String
        @detail ? "drag-end::#{@detail}" : "drag-end"
      end

      def connect(*, after : Bool = false, &block : Proc(Gdk::Drag, Bool, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gdk::Drag, Bool, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drag : Pointer(Void), lib_delete_data : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          drag = Gdk::Drag.new(lib_drag, :none)
          delete_data = lib_delete_data
          ::Box(Proc(Gdk::Drag, Bool, Nil)).unbox(_lib_box).call(drag, delete_data)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::DragSource, Gdk::Drag, Bool, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drag : Pointer(Void), lib_delete_data : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::DragSource.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          drag = Gdk::Drag.new(lib_drag, :none)
          delete_data = lib_delete_data
          ::Box(Proc(Gtk::DragSource, Gdk::Drag, Bool, Nil)).unbox(_lib_box).call(_sender, drag, delete_data)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(drag : Gdk::Drag, delete_data : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-end", drag, delete_data)
      end
    end

    def drag_end_signal
      DragEndSignal.new(self)
    end

    # Emitted when a drag is about to be initiated.
    #
    # It returns the `GdkContentProvider` to use for the drag that is about
    # to start. The default handler for this signal returns the value of
    # the `Gtk::DragSource#content` property, so if you set up that
    # property ahead of time, you don't need to connect to this signal.
    struct PrepareSignal < GObject::Signal
      def name : String
        @detail ? "prepare::#{@detail}" : "prepare"
      end

      def connect(*, after : Bool = false, &block : Proc(Float64, Float64, Gdk::ContentProvider)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Float64, Float64, Gdk::ContentProvider), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Gdk::ContentProvider)).unbox(_lib_box).call(x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::DragSource, Float64, Float64, Gdk::ContentProvider), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::DragSource.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::DragSource, Float64, Float64, Gdk::ContentProvider)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "prepare", x, y)
      end
    end

    def prepare_signal
      PrepareSignal.new(self)
    end
  end
end
