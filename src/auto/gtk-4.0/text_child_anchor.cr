require "../g_object-2.0/object"

module Gtk
  # A `GtkTextChildAnchor` is a spot in a `GtkTextBuffer` where child widgets can
  # be “anchored”.
  #
  # The anchor can have multiple widgets anchored, to allow for multiple views.
  @[GObject::GeneratedWrapper]
  class TextChildAnchor < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::TextChildAnchorClass), class_init,
        sizeof(LibGtk::TextChildAnchor), instance_init, 0)
    end

    GICrystal.define_new_method(TextChildAnchor, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TextChildAnchor`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_text_child_anchor_get_type
    end

    # Creates a new `GtkTextChildAnchor`.
    #
    # Usually you would then insert it into a `GtkTextBuffer` with
    # `Gtk::TextBuffer#insert_child_anchor`. To perform the
    # creation and insertion in one step, use the convenience
    # function `Gtk::TextBuffer#create_child_anchor`.
    def initialize
      # gtk_text_child_anchor_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_text_child_anchor_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new `GtkTextChildAnchor` with the given replacement character.
    #
    # Usually you would then insert it into a `GtkTextBuffer` with
    # `Gtk::TextBuffer#insert_child_anchor`.
    def self.new_with_replacement(character : ::String) : self
      # gtk_text_child_anchor_new_with_replacement: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_text_child_anchor_new_with_replacement(character)

      # Return value handling

      Gtk::TextChildAnchor.new(_retval, GICrystal::Transfer::Full)
    end

    # Determines whether a child anchor has been deleted from
    # the buffer.
    #
    # Keep in mind that the child anchor will be unreferenced
    # when removed from the buffer, so you need to hold your own
    # reference (with g_object_ref()) if you plan to use this
    # function — otherwise all deleted child anchors will also
    # be finalized.
    def deleted : Bool
      # gtk_text_child_anchor_get_deleted: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_child_anchor_get_deleted(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets a list of all widgets anchored at this child anchor.
    #
    # The order in which the widgets are returned is not defined.
    def widgets : Enumerable(Gtk::Widget)
      # gtk_text_child_anchor_get_widgets: (Method)
      # @out_len: (out) (transfer full)
      # Returns: (transfer container) (array length=out_len element-type Interface)

      # Generator::OutArgUsedInReturnPlan
      out_len = 0_u32
      # C call
      _retval = LibGtk.gtk_text_child_anchor_get_widgets(@pointer, pointerof(out_len))

      # Return value handling

      GICrystal.transfer_array(_retval, out_len, GICrystal::Transfer::Container)
    end
  end
end
