require "../g_object-2.0/object"

module Gtk
  # A `GtkTextMark` is a position in a `GtkTextbuffer` that is preserved
  # across modifications.
  #
  # You may wish to begin by reading the
  # [text widget conceptual overview](section-text-widget.html),
  # which gives an overview of all the objects and data types
  # related to the text widget and how they work together.
  #
  # A `GtkTextMark` is like a bookmark in a text buffer; it preserves
  # a position in the text. You can convert the mark to an iterator using
  # [method@Gtk.TextBuffer.get_iter_at_mark]. Unlike iterators, marks remain
  # valid across buffer mutations, because their behavior is defined when
  # text is inserted or deleted. When text containing a mark is deleted,
  # the mark remains in the position originally occupied by the deleted
  # text. When text is inserted at a mark, a mark with “left gravity” will
  # be moved to the beginning of the newly-inserted text, and a mark with
  # “right gravity” will be moved to the end.
  #
  # Note that “left” and “right” here refer to logical direction (left
  # is the toward the start of the buffer); in some languages such as
  # Hebrew the logically-leftmost text is not actually on the left when
  # displayed.
  #
  # Marks are reference counted, but the reference count only controls
  # the validity of the memory; marks can be deleted from the buffer at
  # any time with [method@Gtk.TextBuffer.delete_mark]. Once deleted from
  # the buffer, a mark is essentially useless.
  #
  # Marks optionally have names; these can be convenient to avoid passing
  # the `GtkTextMark` object around.
  #
  # Marks are typically created using the [method@Gtk.TextBuffer.create_mark]
  # function.
  class TextMark < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, left_gravity : Bool? = nil, name : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if left_gravity
        (_names.to_unsafe + _n).value = "left-gravity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, left_gravity)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TextMark.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_text_mark_get_type
    end

    def left_gravity=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "left-gravity", unsafe_value, Pointer(Void).null)
      value
    end

    def left_gravity? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "left-gravity", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def initialize(name : ::String?, left_gravity : Bool)
      # gtk_text_mark_new: (Constructor)
      # @name: (nullable)
      # Returns: (transfer full)

      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      _retval = LibGtk.gtk_text_mark_new(name, left_gravity)
      @pointer = _retval
    end

    def buffer : Gtk::TextBuffer
      # gtk_text_mark_get_buffer: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_mark_get_buffer(self)
      Gtk::TextBuffer.new(_retval, GICrystal::Transfer::None)
    end

    def deleted : Bool
      # gtk_text_mark_get_deleted: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_mark_get_deleted(self)
      GICrystal.to_bool(_retval)
    end

    def left_gravity : Bool
      # gtk_text_mark_get_left_gravity: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_mark_get_left_gravity(self)
      GICrystal.to_bool(_retval)
    end

    def name : ::String?
      # gtk_text_mark_get_name: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_mark_get_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def visible : Bool
      # gtk_text_mark_get_visible: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_mark_get_visible(self)
      GICrystal.to_bool(_retval)
    end

    def visible=(setting : Bool) : Nil
      # gtk_text_mark_set_visible: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_text_mark_set_visible(self, setting)
    end
  end
end
