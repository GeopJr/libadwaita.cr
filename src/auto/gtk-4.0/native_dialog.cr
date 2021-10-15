require "../g_object-2.0/object"

module Gtk
  # Native dialogs are platform dialogs that don't use `GtkDialog`.
  #
  # They are used in order to integrate better with a platform, by
  # looking the same as other native applications and supporting
  # platform specific features.
  #
  # The [class@Gtk.Dialog] functions cannot be used on such objects,
  # but we need a similar API in order to drive them. The `GtkNativeDialog`
  # object is an API that allows you to do this. It allows you to set
  # various common properties on the dialog, as well as show and hide
  # it and get a [signal@Gtk.NativeDialog::response] signal when the user
  # finished with the dialog.
  #
  # Note that unlike `GtkDialog`, `GtkNativeDialog` objects are not
  # toplevel widgets, and GTK does not keep them alive. It is your
  # responsibility to keep a reference until you are done with the
  # object.
  class NativeDialog < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, modal : Bool? = nil, title : ::String? = nil, transient_for : Gtk::Window? = nil, visible : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if modal
        (_names.to_unsafe + _n).value = "modal".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, modal)
        _n += 1
      end
      if title
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if transient_for
        (_names.to_unsafe + _n).value = "transient-for".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transient_for)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(NativeDialog.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_native_dialog_get_type
    end

    def destroy : Nil
      # gtk_native_dialog_destroy: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_native_dialog_destroy(self)
    end

    def modal? : Bool
      # gtk_native_dialog_get_modal: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_native_dialog_get_modal(self)
      GICrystal.to_bool(_retval)
    end

    def title : ::String?
      # gtk_native_dialog_get_title: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_native_dialog_get_title(self)
      ::String.new(_retval) unless _retval.null?
    end

    def transient_for : Gtk::Window?
      # gtk_native_dialog_get_transient_for: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_native_dialog_get_transient_for(self)
      Gtk::Window.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def visible? : Bool
      # gtk_native_dialog_get_visible: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_native_dialog_get_visible(self)
      GICrystal.to_bool(_retval)
    end

    def hide : Nil
      # gtk_native_dialog_hide: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_native_dialog_hide(self)
    end

    def modal=(modal : Bool) : Nil
      # gtk_native_dialog_set_modal: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_native_dialog_set_modal(self, modal)
    end

    def title=(title : ::String) : Nil
      # gtk_native_dialog_set_title: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_native_dialog_set_title(self, title)
    end

    def transient_for=(parent : Gtk::Window?) : Nil
      # gtk_native_dialog_set_transient_for: (Method)
      # @parent: (nullable)
      # Returns: (transfer none)

      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      LibGtk.gtk_native_dialog_set_transient_for(self, parent)
    end

    def show : Nil
      # gtk_native_dialog_show: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_native_dialog_show(self)
    end

    struct ResponseSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "response::#{@detail}" : "response"
      end

      def connect(&block : Proc(Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Nil))
        connect(block)
      end

      def connect(block : Proc(Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(Int32, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(Int32, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::NativeDialog, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, box : Pointer(Void)) {
          sender = Gtk::NativeDialog.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::NativeDialog, Int32, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::NativeDialog, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, box : Pointer(Void)) {
          sender = Gtk::NativeDialog.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::NativeDialog, Int32, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(response_id : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "response", response_id)
      end
    end

    def response_signal
      ResponseSignal.new(self)
    end
  end
end
