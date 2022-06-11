module Gtk
  # `GtkEditable` is an interface for text editing widgets.
  #
  # Typical examples of editable widgets are `Gtk#Entry` and
  # `Gtk#SpinButton`. It contains functions for generically manipulating
  # an editable widget, a large number of action signals used for key bindings,
  # and several signals that an application can connect to modify the behavior
  # of a widget.
  #
  # As an example of the latter usage, by connecting the following handler to
  # [signal@Gtk.Editable::insert-text], an application can convert all entry
  # into a widget into uppercase.
  #
  # ## Forcing entry to uppercase.
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # #include <ctype.h>
  #
  # void
  # insert_text_handler (GtkEditable *editable,
  #                      const char  *text,
  #                      int          length,
  #                      int         *position,
  #                      gpointer     data)
  # {
  #   char *result = g_utf8_strup (text, length);
  #
  #   g_signal_handlers_block_by_func (editable,
  #                                (gpointer) insert_text_handler, data);
  #   gtk_editable_insert_text (editable, result, length, position);
  #   g_signal_handlers_unblock_by_func (editable,
  #                                      (gpointer) insert_text_handler, data);
  #
  #   g_signal_stop_emission_by_name (editable, "insert_text");
  #
  #   g_free (result);
  # }
  # ```
  #
  # ## Implementing GtkEditable
  #
  # The most likely scenario for implementing `GtkEditable` on your own widget
  # is that you will embed a `GtkText` inside a complex widget, and want to
  # delegate the editable functionality to that text widget. `GtkEditable`
  # provides some utility functions to make this easy.
  #
  # In your class_init function, call `Gtk::Editable#install_properties`,
  # passing the first available property ID:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static void
  # my_class_init (MyClass *class)
  # {
  #   ...
  #   g_object_class_install_properties (object_class, NUM_PROPERTIES, props);
  #   gtk_editable_install_properties (object_clas, NUM_PROPERTIES);
  #   ...
  # }
  # ```
  #
  # In your interface_init function for the `GtkEditable` interface, provide
  # an implementation for the get_delegate vfunc that returns your text widget:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # GtkEditable *
  # get_editable_delegate (GtkEditable *editable)
  # {
  #   return GTK_EDITABLE (MY_WIDGET (editable)->text_widget);
  # }
  #
  # static void
  # my_editable_init (GtkEditableInterface *iface)
  # {
  #   iface->get_delegate = get_editable_delegate;
  # }
  # ```
  #
  # You don't need to provide any other vfuncs. The default implementations
  # work by forwarding to the delegate that the GtkEditableInterface.get_delegate()
  # vfunc returns.
  #
  # In your instance_init function, create your text widget, and then call
  # `Gtk::Editable#init_delegate`:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static void
  # my_widget_init (MyWidget *self)
  # {
  #   ...
  #   self->text_widget = gtk_text_new ();
  #   gtk_editable_init_delegate (GTK_EDITABLE (self));
  #   ...
  # }
  # ```
  #
  # In your dispose function, call `Gtk::Editable#finish_delegate` before
  # destroying your text widget:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static void
  # my_widget_dispose (GObject *object)
  # {
  #   ...
  #   gtk_editable_finish_delegate (GTK_EDITABLE (self));
  #   g_clear_pointer (&self->text_widget, gtk_widget_unparent);
  #   ...
  # }
  # ```
  #
  # Finally, use `Gtk::Editable#delegate_set_property` in your `set_property`
  # function (and similar for `get_property`), to set the editable properties:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  #   ...
  #   if (gtk_editable_delegate_set_property (object, prop_id, value, pspec))
  #     return;
  #
  #   switch (prop_id)
  #   ...
  # ```
  #
  # It is important to note that if you create a `GtkEditable` that uses
  # a delegate, the low level [signal@Gtk.Editable::insert-text] and
  # [signal@Gtk.Editable::delete-text] signals will be propagated from the
  # "wrapper" editable to the delegate, but they will not be propagated from
  # the delegate to the "wrapper" editable, as they would cause an infinite
  # recursion. If you wish to connect to the [signal@Gtk.Editable::insert-text]
  # and [signal@Gtk.Editable::delete-text] signals, you will need to connect
  # to them on the delegate obtained via `Gtk::Editable#delegate`.
  module Editable
    def cursor_position : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "cursor-position", pointerof(value), Pointer(Void).null)
      value
    end

    def editable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "editable", unsafe_value, Pointer(Void).null)
      value
    end

    def editable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "editable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def enable_undo=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enable-undo", unsafe_value, Pointer(Void).null)
      value
    end

    def enable_undo? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enable-undo", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def max_width_chars=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "max-width-chars", unsafe_value, Pointer(Void).null)
      value
    end

    def max_width_chars : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "max-width-chars", pointerof(value), Pointer(Void).null)
      value
    end

    def selection_bound : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "selection-bound", pointerof(value), Pointer(Void).null)
      value
    end

    def text=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "text", unsafe_value, Pointer(Void).null)
      value
    end

    def text : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "text", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def width_chars=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "width-chars", unsafe_value, Pointer(Void).null)
      value
    end

    def width_chars : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "width-chars", pointerof(value), Pointer(Void).null)
      value
    end

    def xalign=(value : Float32) : Float32
      unsafe_value = value

      LibGObject.g_object_set(self, "xalign", unsafe_value, Pointer(Void).null)
      value
    end

    def xalign : Float32
      # Returns: None

      value = uninitialized Float32
      LibGObject.g_object_get(self, "xalign", pointerof(value), Pointer(Void).null)
      value
    end

    def self.delegate_get_property(object : GObject::Object, prop_id : UInt32, value : _, pspec : GObject::ParamSpec) : Bool
      # gtk_editable_delegate_get_property: (None)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_editable_delegate_get_property(object, prop_id, value, pspec)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def self.delegate_set_property(object : GObject::Object, prop_id : UInt32, value : _, pspec : GObject::ParamSpec) : Bool
      # gtk_editable_delegate_set_property: (None)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_editable_delegate_set_property(object, prop_id, value, pspec)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def self.install_properties(object_class : GObject::ObjectClass, first_prop : UInt32) : UInt32
      # gtk_editable_install_properties: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_editable_install_properties(object_class, first_prop)

      # Return value handling

      _retval
    end

    def delete_selection : Nil
      # gtk_editable_delete_selection: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_editable_delete_selection(@pointer)

      # Return value handling
    end

    def delete_text(start_pos : Int32, end_pos : Int32) : Nil
      # gtk_editable_delete_text: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_editable_delete_text(@pointer, start_pos, end_pos)

      # Return value handling
    end

    def finish_delegate : Nil
      # gtk_editable_finish_delegate: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_editable_finish_delegate(@pointer)

      # Return value handling
    end

    def alignment : Float32
      # gtk_editable_get_alignment: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_editable_get_alignment(@pointer)

      # Return value handling

      _retval
    end

    def chars(start_pos : Int32, end_pos : Int32) : ::String
      # gtk_editable_get_chars: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_editable_get_chars(@pointer, start_pos, end_pos)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def delegate : Gtk::Editable?
      # gtk_editable_get_delegate: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_editable_get_delegate(@pointer)

      # Return value handling

      Gtk::AbstractEditable.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def editable : Bool
      # gtk_editable_get_editable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_editable_get_editable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def enable_undo : Bool
      # gtk_editable_get_enable_undo: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_editable_get_enable_undo(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def max_width_chars : Int32
      # gtk_editable_get_max_width_chars: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_editable_get_max_width_chars(@pointer)

      # Return value handling

      _retval
    end

    def position : Int32
      # gtk_editable_get_position: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_editable_get_position(@pointer)

      # Return value handling

      _retval
    end

    def selection_bounds : Bool
      # gtk_editable_get_selection_bounds: (Method)
      # @start_pos: (out) (transfer full) (optional)
      # @end_pos: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      start_pos = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      end_pos = Pointer(Int32).null
      # C call
      _retval = LibGtk.gtk_editable_get_selection_bounds(@pointer, start_pos, end_pos)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def text : ::String
      # gtk_editable_get_text: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_editable_get_text(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    def width_chars : Int32
      # gtk_editable_get_width_chars: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_editable_get_width_chars(@pointer)

      # Return value handling

      _retval
    end

    def init_delegate : Nil
      # gtk_editable_init_delegate: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_editable_init_delegate(@pointer)

      # Return value handling
    end

    def insert_text(text : ::String, length : Int32, position : Int32) : Nil
      # gtk_editable_insert_text: (Method)
      # @position: (inout) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_editable_insert_text(@pointer, text, length, position)

      # Return value handling
    end

    def select_region(start_pos : Int32, end_pos : Int32) : Nil
      # gtk_editable_select_region: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_editable_select_region(@pointer, start_pos, end_pos)

      # Return value handling
    end

    def alignment=(xalign : Float32) : Nil
      # gtk_editable_set_alignment: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_editable_set_alignment(@pointer, xalign)

      # Return value handling
    end

    def editable=(is_editable : Bool) : Nil
      # gtk_editable_set_editable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_editable_set_editable(@pointer, is_editable)

      # Return value handling
    end

    def enable_undo=(enable_undo : Bool) : Nil
      # gtk_editable_set_enable_undo: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_editable_set_enable_undo(@pointer, enable_undo)

      # Return value handling
    end

    def max_width_chars=(n_chars : Int32) : Nil
      # gtk_editable_set_max_width_chars: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_editable_set_max_width_chars(@pointer, n_chars)

      # Return value handling
    end

    def position=(position : Int32) : Nil
      # gtk_editable_set_position: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_editable_set_position(@pointer, position)

      # Return value handling
    end

    def text=(text : ::String) : Nil
      # gtk_editable_set_text: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_editable_set_text(@pointer, text)

      # Return value handling
    end

    def width_chars=(n_chars : Int32) : Nil
      # gtk_editable_set_width_chars: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_editable_set_width_chars(@pointer, n_chars)

      # Return value handling
    end

    struct ChangedSignal < GObject::Signal
      def name : String
        @detail ? "changed::#{@detail}" : "changed"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Editable, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractEditable.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Editable, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end

    struct DeleteTextSignal < GObject::Signal
      def name : String
        @detail ? "delete-text::#{@detail}" : "delete-text"
      end

      def connect(*, after : Bool = false, &block : Proc(Int32, Int32, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Int32, Int32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_start_pos : Int32, lib_end_pos : Int32, _lib_box : Pointer(Void)) {
          start_pos = lib_start_pos
          end_pos = lib_end_pos
          ::Box(Proc(Int32, Int32, Nil)).unbox(_lib_box).call(start_pos, end_pos)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Editable, Int32, Int32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_start_pos : Int32, lib_end_pos : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractEditable.new(_lib_sender, GICrystal::Transfer::None)
          start_pos = lib_start_pos
          end_pos = lib_end_pos
          ::Box(Proc(Gtk::Editable, Int32, Int32, Nil)).unbox(_lib_box).call(_sender, start_pos, end_pos)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(start_pos : Int32, end_pos : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "delete-text", start_pos, end_pos)
      end
    end

    def delete_text_signal
      DeleteTextSignal.new(self)
    end

    struct InsertTextSignal < GObject::Signal
      def name : String
        @detail ? "insert-text::#{@detail}" : "insert-text"
      end

      def connect(*, after : Bool = false, &block : Proc(::String, Int32, Int32, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(::String, Int32, Int32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_text : Pointer(LibC::Char), lib_length : Int32, lib_position : Int32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          text = ::String.new(lib_text)
          length = lib_length
          position = lib_position
          ::Box(Proc(::String, Int32, Int32, Nil)).unbox(_lib_box).call(text, length, position)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Editable, ::String, Int32, Int32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_text : Pointer(LibC::Char), lib_length : Int32, lib_position : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractEditable.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          text = ::String.new(lib_text)
          length = lib_length
          position = lib_position
          ::Box(Proc(Gtk::Editable, ::String, Int32, Int32, Nil)).unbox(_lib_box).call(_sender, text, length, position)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(text : ::String, length : Int32, position : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "insert-text", text, length, position)
      end
    end

    def insert_text_signal
      InsertTextSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractEditable < GObject::Object
    include Editable

    GICrystal.define_new_method(Gtk::AbstractEditable, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_editable_get_type
    end

    # Cast a `GObject::Object` to `Editable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Editable")
    end

    # Cast a `GObject::Object` to `Editable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
