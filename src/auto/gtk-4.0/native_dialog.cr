require "../g_object-2.0/object"

module Gtk
  # Native dialogs are platform dialogs that don't use `GtkDialog`.
  #
  # They are used in order to integrate better with a platform, by
  # looking the same as other native applications and supporting
  # platform specific features.
  #
  # The `Gtk#Dialog` functions cannot be used on such objects,
  # but we need a similar API in order to drive them. The `GtkNativeDialog`
  # object is an API that allows you to do this. It allows you to set
  # various common properties on the dialog, as well as show and hide
  # it and get a `Gtk::NativeDialog::#response` signal when the user
  # finished with the dialog.
  #
  # Note that unlike `GtkDialog`, `GtkNativeDialog` objects are not
  # toplevel widgets, and GTK does not keep them alive. It is your
  # responsibility to keep a reference until you are done with the
  # object.
  @[GObject::GeneratedWrapper]
  class NativeDialog < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::NativeDialogClass), class_init,
        sizeof(LibGtk::NativeDialog), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, modal : Bool? = nil, title : ::String? = nil, transient_for : Gtk::Window? = nil, visible : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !modal.nil?
        (_names.to_unsafe + _n).value = "modal".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, modal)
        _n += 1
      end
      if !title.nil?
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if !transient_for.nil?
        (_names.to_unsafe + _n).value = "transient-for".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transient_for)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(NativeDialog.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_native_dialog_get_type
    end

    def modal=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "modal", unsafe_value, Pointer(Void).null)
      value
    end

    def modal? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "modal", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def title=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "title", unsafe_value, Pointer(Void).null)
      value
    end

    def title : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "title", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def transient_for=(value : Gtk::Window?) : Gtk::Window?
      unsafe_value = value

      LibGObject.g_object_set(self, "transient-for", unsafe_value, Pointer(Void).null)
      value
    end

    def transient_for : Gtk::Window?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "transient-for", pointerof(value), Pointer(Void).null)
      Gtk::Window.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def visible=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "visible", unsafe_value, Pointer(Void).null)
      value
    end

    def visible? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "visible", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Destroys a dialog.
    #
    # When a dialog is destroyed, it will break any references it holds
    # to other objects.
    #
    # If it is visible it will be hidden and any underlying window system
    # resources will be destroyed.
    #
    # Note that this does not release any reference to the object (as opposed
    # to destroying a `GtkWindow`) because there is no reference from the
    # windowing system to the `GtkNativeDialog`.
    def destroy : Nil
      # gtk_native_dialog_destroy: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_native_dialog_destroy(self)

      # Return value handling
    end

    # Returns whether the dialog is modal.
    def modal : Bool
      # gtk_native_dialog_get_modal: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_native_dialog_get_modal(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the title of the `GtkNativeDialog`.
    def title : ::String?
      # gtk_native_dialog_get_title: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_native_dialog_get_title(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Fetches the transient parent for this window.
    def transient_for : Gtk::Window?
      # gtk_native_dialog_get_transient_for: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_native_dialog_get_transient_for(self)

      # Return value handling

      Gtk::Window.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Determines whether the dialog is visible.
    def visible : Bool
      # gtk_native_dialog_get_visible: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_native_dialog_get_visible(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Hides the dialog if it is visible, aborting any interaction.
    #
    # Once this is called the `Gtk::NativeDialog::#response` signal
    # will *not* be emitted until after the next call to
    # `Gtk::NativeDialog#show`.
    #
    # If the dialog is not visible this does nothing.
    def hide : Nil
      # gtk_native_dialog_hide: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_native_dialog_hide(self)

      # Return value handling
    end

    # Sets a dialog modal or non-modal.
    #
    # Modal dialogs prevent interaction with other windows in the same
    # application. To keep modal dialogs on top of main application
    # windows, use `Gtk::NativeDialog#transient_for=` to make
    # the dialog transient for the parent; most window managers will
    # then disallow lowering the dialog below the parent.
    def modal=(modal : Bool) : Nil
      # gtk_native_dialog_set_modal: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_native_dialog_set_modal(self, modal)

      # Return value handling
    end

    # Sets the title of the `GtkNativeDialog.`
    def title=(title : ::String) : Nil
      # gtk_native_dialog_set_title: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_native_dialog_set_title(self, title)

      # Return value handling
    end

    # Dialog windows should be set transient for the main application
    # window they were spawned from.
    #
    # This allows window managers to e.g. keep the dialog on top of the
    # main window, or center the dialog over the main window.
    #
    # Passing %NULL for @parent unsets the current transient window.
    def transient_for=(parent : Gtk::Window?) : Nil
      # gtk_native_dialog_set_transient_for: (Method | Setter)
      # @parent: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      # C call
      LibGtk.gtk_native_dialog_set_transient_for(self, parent)

      # Return value handling
    end

    # Shows the dialog on the display.
    #
    # When the user accepts the state of the dialog the dialog will
    # be automatically hidden and the `Gtk::NativeDialog::#response`
    # signal will be emitted.
    #
    # Multiple calls while the dialog is visible will be ignored.
    def show : Nil
      # gtk_native_dialog_show: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_native_dialog_show(self)

      # Return value handling
    end

    # Emitted when the user responds to the dialog.
    #
    # When this is called the dialog has been hidden.
    #
    # If you call `Gtk::NativeDialog#hide` before the user
    # responds to the dialog this signal will not be emitted.
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
