require "./im_context"

module Gtk
  # `GtkIMMulticontext` is an input method context supporting multiple,
  # switchable input methods.
  #
  # Text widgets such as `GtkText` or `GtkTextView` use a `GtkIMMultiContext`
  # to implement their `im-module` property for switching between different
  # input methods.
  @[GObject::GeneratedWrapper]
  class IMMulticontext < IMContext
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::IMMulticontextClass), class_init,
        sizeof(LibGtk::IMMulticontext), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, input_hints : Gtk::InputHints? = nil, input_purpose : Gtk::InputPurpose? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !input_hints.nil?
        (_names.to_unsafe + _n).value = "input-hints".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_hints)
        _n += 1
      end
      if !input_purpose.nil?
        (_names.to_unsafe + _n).value = "input-purpose".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_purpose)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(IMMulticontext.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_im_multicontext_get_type
    end

    # Creates a new `GtkIMMulticontext`.
    def initialize
      # gtk_im_multicontext_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_im_multicontext_new

      # Return value handling

      @pointer = _retval
    end

    # Gets the id of the currently active delegate of the @context.
    def context_id : ::String
      # gtk_im_multicontext_get_context_id: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_im_multicontext_get_context_id(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Sets the context id for @context.
    #
    # This causes the currently active delegate of @context to be
    # replaced by the delegate corresponding to the new context id.
    #
    # Setting this to a non-%NULL value overrides the system-wide
    # IM module setting. See the [property@Gtk.Settings:gtk-im-module]
    # property.
    def context_id=(context_id : ::String?) : Nil
      # gtk_im_multicontext_set_context_id: (Method)
      # @context_id: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      context_id = if context_id.nil?
                     Pointer(LibC::Char).null
                   else
                     context_id.to_unsafe
                   end

      # C call
      LibGtk.gtk_im_multicontext_set_context_id(self, context_id)

      # Return value handling
    end
  end
end
