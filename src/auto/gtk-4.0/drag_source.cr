require "./gesture_single"

module Gtk
  # `GtkDragSource` is an event controller to initiate Drag-And-Drop operations.
  #
  # `GtkDragSource` can be set up with the necessary
  # ingredients for a DND operation ahead of time. This includes
  # the source for the data that is being transferred, in the form
  # of a [class@Gdk.ContentProvider], the desired action, and the icon to
  # use during the drag operation. After setting it up, the drag
  # source must be added to a widget as an event controller, using
  # [method@Gtk.Widget.add_controller].
  #
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
  # [signal@Gtk.DragSource::prepare] and [signal@Gtk.DragSource::drag-begin]
  # signals.
  #
  # The ::prepare signal is emitted before a drag is started, and
  # can be used to set the content provider and actions that the
  # drag should be started with.
  #
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
  # ```c
  # static void
  # on_drag_begin (GtkDragSource *source,
  #                GtkDrag       *drag,
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
  class DragSource < GestureSingle
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, actions : Gdk::DragAction? = nil, button : UInt32? = nil, content : Gdk::ContentProvider? = nil, exclusive : Bool? = nil, n_points : UInt32? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, touch_only : Bool? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[10]
      _values = StaticArray(LibGObject::Value, 10).new(LibGObject::Value.new)
      _n = 0

      if actions
        (_names.to_unsafe + _n).value = "actions".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, actions)
        _n += 1
      end
      if button
        (_names.to_unsafe + _n).value = "button".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, button)
        _n += 1
      end
      if content
        (_names.to_unsafe + _n).value = "content".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, content)
        _n += 1
      end
      if exclusive
        (_names.to_unsafe + _n).value = "exclusive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, exclusive)
        _n += 1
      end
      if n_points
        (_names.to_unsafe + _n).value = "n-points".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_points)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if propagation_limit
        (_names.to_unsafe + _n).value = "propagation-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_limit)
        _n += 1
      end
      if propagation_phase
        (_names.to_unsafe + _n).value = "propagation-phase".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_phase)
        _n += 1
      end
      if touch_only
        (_names.to_unsafe + _n).value = "touch-only".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, touch_only)
        _n += 1
      end
      if widget
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DragSource.g_type, _n, _names, _values)
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
      Gdk::DragAction.from_value(value)
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

    def initialize
      # gtk_drag_source_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_drag_source_new
      @pointer = _retval
    end

    def drag_cancel : Nil
      # gtk_drag_source_drag_cancel: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_drag_source_drag_cancel(self)
    end

    def actions : Gdk::DragAction
      # gtk_drag_source_get_actions: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_drag_source_get_actions(self)
      Gdk::DragAction.from_value(_retval)
    end

    def content : Gdk::ContentProvider?
      # gtk_drag_source_get_content: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_drag_source_get_content(self)
      Gdk::ContentProvider.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def drag : Gdk::Drag?
      # gtk_drag_source_get_drag: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_drag_source_get_drag(self)
      Gdk::Drag.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def actions=(actions : Gdk::DragAction) : Nil
      # gtk_drag_source_set_actions: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_drag_source_set_actions(self, actions)
    end

    def content=(content : Gdk::ContentProvider?) : Nil
      # gtk_drag_source_set_content: (Method)
      # @content: (nullable)
      # Returns: (transfer none)

      content = if content.nil?
                  Pointer(Void).null
                else
                  content.to_unsafe
                end

      LibGtk.gtk_drag_source_set_content(self, content)
    end

    def set_icon(paintable : Gdk::Paintable?, hot_x : Int32, hot_y : Int32) : Nil
      # gtk_drag_source_set_icon: (Method)
      # @paintable: (nullable)
      # Returns: (transfer none)

      paintable = if paintable.nil?
                    Pointer(Void).null
                  else
                    paintable.to_unsafe
                  end

      LibGtk.gtk_drag_source_set_icon(self, paintable, hot_x, hot_y)
    end

    struct DragBeginSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drag-begin::#{@detail}" : "drag-begin"
      end

      def connect(&block : Proc(Gdk::Drag, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Drag, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::Drag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Drag.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Drag, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Drag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Drag.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Drag, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::DragSource, Gdk::Drag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::DragSource.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drag.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DragSource, Gdk::Drag, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DragSource, Gdk::Drag, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::DragSource.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drag.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DragSource, Gdk::Drag, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(drag : Gdk::Drag) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-begin", drag)
      end
    end

    def drag_begin_signal
      DragBeginSignal.new(self)
    end

    struct DragCancelSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drag-cancel::#{@detail}" : "drag-cancel"
      end

      def connect(&block : Proc(Gdk::Drag, Gdk::DragCancelReason, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Drag, Gdk::DragCancelReason, Bool))
        connect(block)
      end

      def connect(block : Proc(Gdk::Drag, Gdk::DragCancelReason, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = Gdk::Drag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gdk::DragCancelReason.from_value(lib_arg1)
          ::Box(Proc(Gdk::Drag, Gdk::DragCancelReason, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Drag, Gdk::DragCancelReason, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = Gdk::Drag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gdk::DragCancelReason.from_value(lib_arg1)
          ::Box(Proc(Gdk::Drag, Gdk::DragCancelReason, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::DragSource, Gdk::Drag, Gdk::DragCancelReason, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::DragSource.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gdk::DragCancelReason.from_value(lib_arg1)
          ::Box(Proc(Gtk::DragSource, Gdk::Drag, Gdk::DragCancelReason, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DragSource, Gdk::Drag, Gdk::DragCancelReason, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::DragSource.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gdk::DragCancelReason.from_value(lib_arg1)
          ::Box(Proc(Gtk::DragSource, Gdk::Drag, Gdk::DragCancelReason, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(drag : Gdk::Drag, reason : Gdk::DragCancelReason) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-cancel", drag, reason)
      end
    end

    def drag_cancel_signal
      DragCancelSignal.new(self)
    end

    struct DragEndSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drag-end::#{@detail}" : "drag-end"
      end

      def connect(&block : Proc(Gdk::Drag, Bool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Drag, Bool, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::Drag, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gdk::Drag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gdk::Drag, Bool, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Drag, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gdk::Drag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gdk::Drag, Bool, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::DragSource, Gdk::Drag, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::DragSource.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gtk::DragSource, Gdk::Drag, Bool, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DragSource, Gdk::Drag, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::DragSource.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gtk::DragSource, Gdk::Drag, Bool, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(drag : Gdk::Drag, delete_data : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-end", drag, delete_data)
      end
    end

    def drag_end_signal
      DragEndSignal.new(self)
    end

    struct PrepareSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "prepare::#{@detail}" : "prepare"
      end

      def connect(&block : Proc(Float64, Float64, Gdk::ContentProvider))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Gdk::ContentProvider))
        connect(block)
      end

      def connect(block : Proc(Float64, Float64, Gdk::ContentProvider))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Gdk::ContentProvider)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Float64, Float64, Gdk::ContentProvider))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Gdk::ContentProvider)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::DragSource, Float64, Float64, Gdk::ContentProvider))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::DragSource.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::DragSource, Float64, Float64, Gdk::ContentProvider)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DragSource, Float64, Float64, Gdk::ContentProvider))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::DragSource.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::DragSource, Float64, Float64, Gdk::ContentProvider)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
