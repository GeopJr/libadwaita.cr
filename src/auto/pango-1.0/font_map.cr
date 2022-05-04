require "../g_object-2.0/object"

module Pango
  # A `PangoFontMap` represents the set of fonts available for a
  # particular rendering system.
  #
  # This is a virtual object with implementations being specific to
  # particular rendering systems.
  @[GObject::GeneratedWrapper]
  class FontMap < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibPango::FontMapClass), class_init,
        sizeof(LibPango::FontMap), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_font_map_get_type
    end

    # Forces a change in the context, which will cause any `PangoContext`
    # using this fontmap to change.
    #
    # This function is only useful when implementing a new backend
    # for Pango, something applications won't do. Backends should
    # call this function if they have attached extra data to the
    # context and such data is changed.
    def changed : Nil
      # pango_font_map_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_map_changed(self)

      # Return value handling
    end

    # Creates a `PangoContext` connected to @fontmap.
    #
    # This is equivalent to `Pango::Context.new` followed by
    # `Pango::Context#font_map=`.
    #
    # If you are using Pango as part of a higher-level system,
    # that system may have it's own way of create a `PangoContext`.
    # For instance, the GTK toolkit has, among others,
    # gtk_widget_get_pango_context(). Use those instead.
    def create_context : Pango::Context
      # pango_font_map_create_context: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_font_map_create_context(self)

      # Return value handling

      Pango::Context.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets a font family by name.
    def family(name : ::String) : Pango::FontFamily
      # pango_font_map_get_family: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_map_get_family(self, name)

      # Return value handling

      Pango::FontFamily.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the current serial number of @fontmap.
    #
    # The serial number is initialized to an small number larger than zero
    # when a new fontmap is created and is increased whenever the fontmap
    # is changed. It may wrap, but will never have the value 0. Since it can
    # wrap, never compare it with "less than", always use "not equals".
    #
    # The fontmap can only be changed using backend-specific API, like changing
    # fontmap resolution.
    #
    # This can be used to automatically detect changes to a `PangoFontMap`,
    # like in `PangoContext`.
    def serial : UInt32
      # pango_font_map_get_serial: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_map_get_serial(self)

      # Return value handling

      _retval
    end

    # List all families for a fontmap.
    #
    # Note that the returned families are not in any particular order.
    #
    # `PangoFontMap` also implemented the `Gio#ListModel` interface
    # for enumerating families.
    def list_families(families : Enumerable(Pango::FontFamily)) : Nil
      # pango_font_map_list_families: (Method)
      # @families: (out) (transfer container) (array length=n_families element-type Interface)
      # @n_families: (out) (transfer full)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_families = families.size # Generator::ArrayArgPlan
      families = families.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibPango.pango_font_map_list_families(self, families, n_families)

      # Return value handling
    end

    def list_families(*families : Pango::FontFamily)
      list_families(families)
    end

    # Load the font in the fontmap that is the closest match for @desc.
    def load_font(context : Pango::Context, desc : Pango::FontDescription) : Pango::Font?
      # pango_font_map_load_font: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_font_map_load_font(self, context, desc)

      # Return value handling

      Pango::Font.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Load a set of fonts in the fontmap that can be used to render
    # a font matching @desc.
    def load_fontset(context : Pango::Context, desc : Pango::FontDescription, language : Pango::Language) : Pango::Fontset?
      # pango_font_map_load_fontset: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_font_map_load_fontset(self, context, desc, language)

      # Return value handling

      Pango::Fontset.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end
  end
end
