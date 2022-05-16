module Gtk
  # `GtkPrintOperationPreview` is the interface that is used to
  # implement print preview.
  #
  # A `GtkPrintOperationPreview` object is passed to the
  # `Gtk::PrintOperation::#preview` signal by
  # `Gtk#PrintOperation`.
  module PrintOperationPreview
    def end_preview : Nil
      # gtk_print_operation_preview_end_preview: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_preview_end_preview(@pointer)

      # Return value handling
    end

    def is_selected(page_nr : Int32) : Bool
      # gtk_print_operation_preview_is_selected: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_operation_preview_is_selected(@pointer, page_nr)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def render_page(page_nr : Int32) : Nil
      # gtk_print_operation_preview_render_page: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_preview_render_page(@pointer, page_nr)

      # Return value handling
    end

    struct GotPageSizeSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "got-page-size::#{@detail}" : "got-page-size"
      end

      def connect(&block : Proc(Gtk::PrintContext, Gtk::PageSetup, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::PrintContext, Gtk::PageSetup, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::PrintContext, Gtk::PageSetup, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context : Pointer(Void), lib_page_setup : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          context = Gtk::PrintContext.new(lib_context, :none)
          # Generator::BuiltInTypeArgPlan
          page_setup = Gtk::PageSetup.new(lib_page_setup, :none)
          ::Box(Proc(Gtk::PrintContext, Gtk::PageSetup, Nil)).unbox(_lib_box).call(context, page_setup)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::PrintContext, Gtk::PageSetup, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context : Pointer(Void), lib_page_setup : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          context = Gtk::PrintContext.new(lib_context, :none)
          # Generator::BuiltInTypeArgPlan
          page_setup = Gtk::PageSetup.new(lib_page_setup, :none)
          ::Box(Proc(Gtk::PrintContext, Gtk::PageSetup, Nil)).unbox(_lib_box).call(context, page_setup)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::PageSetup, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context : Pointer(Void), lib_page_setup : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractPrintOperationPreview.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          context = Gtk::PrintContext.new(lib_context, :none)
          # Generator::BuiltInTypeArgPlan
          page_setup = Gtk::PageSetup.new(lib_page_setup, :none)
          ::Box(Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::PageSetup, Nil)).unbox(_lib_box).call(_sender, context, page_setup)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::PageSetup, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context : Pointer(Void), lib_page_setup : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractPrintOperationPreview.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          context = Gtk::PrintContext.new(lib_context, :none)
          # Generator::BuiltInTypeArgPlan
          page_setup = Gtk::PageSetup.new(lib_page_setup, :none)
          ::Box(Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::PageSetup, Nil)).unbox(_lib_box).call(_sender, context, page_setup)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(context : Gtk::PrintContext, page_setup : Gtk::PageSetup) : Nil
        LibGObject.g_signal_emit_by_name(@source, "got-page-size", context, page_setup)
      end
    end

    def got_page_size_signal
      GotPageSizeSignal.new(self)
    end

    struct ReadySignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "ready::#{@detail}" : "ready"
      end

      def connect(&block : Proc(Gtk::PrintContext, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::PrintContext, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::PrintContext, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          context = Gtk::PrintContext.new(lib_context, :none)
          ::Box(Proc(Gtk::PrintContext, Nil)).unbox(_lib_box).call(context)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::PrintContext, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          context = Gtk::PrintContext.new(lib_context, :none)
          ::Box(Proc(Gtk::PrintContext, Nil)).unbox(_lib_box).call(context)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractPrintOperationPreview.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          context = Gtk::PrintContext.new(lib_context, :none)
          ::Box(Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Nil)).unbox(_lib_box).call(_sender, context)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractPrintOperationPreview.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          context = Gtk::PrintContext.new(lib_context, :none)
          ::Box(Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Nil)).unbox(_lib_box).call(_sender, context)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(context : Gtk::PrintContext) : Nil
        LibGObject.g_signal_emit_by_name(@source, "ready", context)
      end
    end

    def ready_signal
      ReadySignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractPrintOperationPreview < GObject::Object
    include PrintOperationPreview

    GICrystal.define_new_method(Gtk::AbstractPrintOperationPreview, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_print_operation_preview_get_type
    end

    # Cast a `GObject::Object` to `PrintOperationPreview`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to PrintOperationPreview")
    end

    # Cast a `GObject::Object` to `PrintOperationPreview`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
