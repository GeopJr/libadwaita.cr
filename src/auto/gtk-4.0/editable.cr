module Gtk
  # `GtkEditable` is an interface for text editing widgets.
  #
  # Typical examples of editable widgets are [class@Gtk.Entry] and
  # [class@Gtk.SpinButton]. It contains functions for generically manipulating
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
  # In your class_init function, call [func@Gtk.Editable.install_properties],
  # passing the first available property ID:
  #
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
  # [method@Gtk.Editable.init_delegate]:
  #
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
  # In your dispose function, call [method@Gtk.Editable.finish_delegate] before
  # destroying your text widget:
  #
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
  # Finally, use [func@Gtk.Editable.delegate_set_property] in your `set_property`
  # function (and similar for `get_property`), to set the editable properties:
  #
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
  # to them on the delegate obtained via [method@Gtk.Editable.get_delegate].
  module Editable
    def self.delegate_get_property(object : GObject::Object, prop_id : UInt32, value : _, pspec : GObject::ParamSpec) : Bool
      # gtk_editable_delegate_get_property: (None)
      # Returns: (transfer none)

      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      _retval = LibGtk.gtk_editable_delegate_get_property(object, prop_id, value, pspec)
      GICrystal.to_bool(_retval)
    end

    def self.delegate_set_property(object : GObject::Object, prop_id : UInt32, value : _, pspec : GObject::ParamSpec) : Bool
      # gtk_editable_delegate_set_property: (None)
      # Returns: (transfer none)

      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      _retval = LibGtk.gtk_editable_delegate_set_property(object, prop_id, value, pspec)
      GICrystal.to_bool(_retval)
    end

    def self.install_properties(object_class : GObject::ObjectClass, first_prop : UInt32) : UInt32
      # gtk_editable_install_properties: (None)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_editable_install_properties(object_class, first_prop)
      _retval
    end

    def delete_selection : Nil
      # gtk_editable_delete_selection: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_editable_delete_selection(self)
    end

    def delete_text(start_pos : Int32, end_pos : Int32) : Nil
      # gtk_editable_delete_text: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_editable_delete_text(self, start_pos, end_pos)
    end

    def finish_delegate : Nil
      # gtk_editable_finish_delegate: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_editable_finish_delegate(self)
    end

    def alignment : Float32
      # gtk_editable_get_alignment: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_editable_get_alignment(self)
      _retval
    end

    def chars(start_pos : Int32, end_pos : Int32) : ::String
      # gtk_editable_get_chars: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_editable_get_chars(self, start_pos, end_pos)
      GICrystal.transfer_full(_retval)
    end

    def delegate : Gtk::Editable?
      # gtk_editable_get_delegate: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_editable_get_delegate(self)
      Gtk::Editable__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def editable? : Bool
      # gtk_editable_get_editable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_editable_get_editable(self)
      GICrystal.to_bool(_retval)
    end

    def enable_undo? : Bool
      # gtk_editable_get_enable_undo: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_editable_get_enable_undo(self)
      GICrystal.to_bool(_retval)
    end

    def max_width_chars : Int32
      # gtk_editable_get_max_width_chars: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_editable_get_max_width_chars(self)
      _retval
    end

    def position : Int32
      # gtk_editable_get_position: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_editable_get_position(self)
      _retval
    end

    def selection_bounds : Bool
      # gtk_editable_get_selection_bounds: (Method)
      # @start_pos: (out) (transfer full) (optional)
      # @end_pos: (out) (transfer full) (optional)
      # Returns: (transfer none)

      start_pos = Pointer(Int32).null
      end_pos = Pointer(Int32).null

      _retval = LibGtk.gtk_editable_get_selection_bounds(self, start_pos, end_pos)
      GICrystal.to_bool(_retval)
    end

    def text : ::String
      # gtk_editable_get_text: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_editable_get_text(self)
      ::String.new(_retval)
    end

    def width_chars : Int32
      # gtk_editable_get_width_chars: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_editable_get_width_chars(self)
      _retval
    end

    def init_delegate : Nil
      # gtk_editable_init_delegate: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_editable_init_delegate(self)
    end

    def insert_text(text : ::String, length : Int32, position : Int32) : Nil
      # gtk_editable_insert_text: (Method)
      # @position: (inout) (transfer full)
      # Returns: (transfer none)

      LibGtk.gtk_editable_insert_text(self, text, length, position)
    end

    def select_region(start_pos : Int32, end_pos : Int32) : Nil
      # gtk_editable_select_region: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_editable_select_region(self, start_pos, end_pos)
    end

    def alignment=(xalign : Float32) : Nil
      # gtk_editable_set_alignment: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_editable_set_alignment(self, xalign)
    end

    def editable=(is_editable : Bool) : Nil
      # gtk_editable_set_editable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_editable_set_editable(self, is_editable)
    end

    def enable_undo=(enable_undo : Bool) : Nil
      # gtk_editable_set_enable_undo: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_editable_set_enable_undo(self, enable_undo)
    end

    def max_width_chars=(n_chars : Int32) : Nil
      # gtk_editable_set_max_width_chars: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_editable_set_max_width_chars(self, n_chars)
    end

    def position=(position : Int32) : Nil
      # gtk_editable_set_position: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_editable_set_position(self, position)
    end

    def text=(text : ::String) : Nil
      # gtk_editable_set_text: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_editable_set_text(self, text)
    end

    def width_chars=(n_chars : Int32) : Nil
      # gtk_editable_set_width_chars: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_editable_set_width_chars(self, n_chars)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Editable__Impl
    include Editable

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_editable_get_type
    end

    # Cast a `GObject::Object` to `Editable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Editable")
    end

    # Cast a `GObject::Object` to `Editable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
