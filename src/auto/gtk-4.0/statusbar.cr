require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # A `GtkStatusbar` widget is usually placed along the bottom of an application's
  # main `Gtk#Window`.
  #
  # ![An example GtkStatusbar](statusbar.png)
  #
  # A `GtkStatusBar` may provide a regular commentary of the application's
  # status (as is usually the case in a web browser, for example), or may be
  # used to simply output a message when the status changes, (when an upload
  # is complete in an FTP client, for example).
  #
  # Status bars in GTK maintain a stack of messages. The message at
  # the top of the each bar’s stack is the one that will currently be displayed.
  #
  # Any messages added to a statusbar’s stack must specify a context id that
  # is used to uniquely identify the source of a message. This context id can
  # be generated by `Gtk::Statusbar#context_id`, given a message and
  # the statusbar that it will be added to. Note that messages are stored in a
  # stack, and when choosing which message to display, the stack structure is
  # adhered to, regardless of the context identifier of a message.
  #
  # One could say that a statusbar maintains one stack of messages for
  # display purposes, but allows multiple message producers to maintain
  # sub-stacks of the messages they produced (via context ids).
  #
  # Status bars are created using `Gtk::Statusbar.new`.
  #
  # Messages are added to the bar’s stack with `Gtk::Statusbar#push`.
  #
  # The message at the top of the stack can be removed using
  # `Gtk::Statusbar#pop`. A message can be removed from anywhere in the
  # stack if its message id was recorded at the time it was added. This is done
  # using `Gtk::Statusbar#remove`.
  #
  # ## CSS node
  #
  # `GtkStatusbar` has a single CSS node with name `statusbar`.
  @[GObject::GeneratedWrapper]
  class Statusbar < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(Statusbar, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Statusbar`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[35]
      _values = StaticArray(LibGObject::Value, 35).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !can_focus.nil?
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if !can_target.nil?
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if !css_classes.nil?
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if !css_name.nil?
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if !cursor.nil?
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if !focus_on_click.nil?
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if !focusable.nil?
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if !halign.nil?
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if !has_default.nil?
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if !has_focus.nil?
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if !has_tooltip.nil?
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if !height_request.nil?
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if !hexpand.nil?
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if !hexpand_set.nil?
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !margin_bottom.nil?
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if !margin_end.nil?
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if !margin_start.nil?
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if !margin_top.nil?
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !opacity.nil?
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if !overflow.nil?
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if !parent.nil?
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if !receives_default.nil?
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if !root.nil?
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if !scale_factor.nil?
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !tooltip_markup.nil?
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if !tooltip_text.nil?
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if !valign.nil?
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if !vexpand.nil?
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if !vexpand_set.nil?
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Statusbar.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_statusbar_get_type
    end

    # Returns a new context identifier, given a description
    # of the actual context.
    #
    # Note that the description is not shown in the UI.
    def context_id(context_description : ::String) : UInt32
      # gtk_statusbar_get_context_id: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_statusbar_get_context_id(@pointer, context_description)

      # Return value handling

      _retval
    end

    # Removes the first message in the `GtkStatusbar`’s stack
    # with the given context id.
    #
    # Note that this may not change the displayed message,
    # if the message at the top of the stack has a different
    # context id.
    def pop(context_id : UInt32) : Nil
      # gtk_statusbar_pop: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_statusbar_pop(@pointer, context_id)

      # Return value handling
    end

    # Pushes a new message onto a statusbar’s stack.
    def push(context_id : UInt32, text : ::String) : UInt32
      # gtk_statusbar_push: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_statusbar_push(@pointer, context_id, text)

      # Return value handling

      _retval
    end

    # Forces the removal of a message from a statusbar’s stack.
    # The exact @context_id and @message_id must be specified.
    def remove(context_id : UInt32, message_id : UInt32) : Nil
      # gtk_statusbar_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_statusbar_remove(@pointer, context_id, message_id)

      # Return value handling
    end

    # Forces the removal of all messages from a statusbar's
    # stack with the exact @context_id.
    def remove_all(context_id : UInt32) : Nil
      # gtk_statusbar_remove_all: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_statusbar_remove_all(@pointer, context_id)

      # Return value handling
    end

    # Emitted whenever a new message is popped off a statusbar's stack.
    struct TextPoppedSignal < GObject::Signal
      def name : String
        @detail ? "text-popped::#{@detail}" : "text-popped"
      end

      def connect(*, after : Bool = false, &block : Proc(UInt32, ::String, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(UInt32, ::String, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context_id : UInt32, lib_text : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          context_id = lib_context_id
          # Generator::BuiltInTypeArgPlan
          text = ::String.new(lib_text)
          ::Box(Proc(UInt32, ::String, Nil)).unbox(_lib_box).call(context_id, text)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Statusbar, UInt32, ::String, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context_id : UInt32, lib_text : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::Statusbar.new(_lib_sender, GICrystal::Transfer::None)
          context_id = lib_context_id
          # Generator::BuiltInTypeArgPlan
          text = ::String.new(lib_text)
          ::Box(Proc(Gtk::Statusbar, UInt32, ::String, Nil)).unbox(_lib_box).call(_sender, context_id, text)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(context_id : UInt32, text : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "text-popped", context_id, text)
      end
    end

    def text_popped_signal
      TextPoppedSignal.new(self)
    end

    # Emitted whenever a new message gets pushed onto a statusbar's stack.
    struct TextPushedSignal < GObject::Signal
      def name : String
        @detail ? "text-pushed::#{@detail}" : "text-pushed"
      end

      def connect(*, after : Bool = false, &block : Proc(UInt32, ::String, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(UInt32, ::String, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context_id : UInt32, lib_text : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          context_id = lib_context_id
          # Generator::BuiltInTypeArgPlan
          text = ::String.new(lib_text)
          ::Box(Proc(UInt32, ::String, Nil)).unbox(_lib_box).call(context_id, text)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Statusbar, UInt32, ::String, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context_id : UInt32, lib_text : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::Statusbar.new(_lib_sender, GICrystal::Transfer::None)
          context_id = lib_context_id
          # Generator::BuiltInTypeArgPlan
          text = ::String.new(lib_text)
          ::Box(Proc(Gtk::Statusbar, UInt32, ::String, Nil)).unbox(_lib_box).call(_sender, context_id, text)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(context_id : UInt32, text : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "text-pushed", context_id, text)
      end
    end

    def text_pushed_signal
      TextPushedSignal.new(self)
    end
  end
end
