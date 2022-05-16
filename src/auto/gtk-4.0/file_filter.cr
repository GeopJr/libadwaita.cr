require "./filter"
require "./buildable"

module Gtk
  # `GtkFileFilter` filters files by name or mime type.
  #
  # `GtkFileFilter` can be used to restrict the files being shown in a
  # `GtkFileChooser`. Files can be filtered based on their name (with
  # `Gtk::FileFilter#add_pattern` or `Gtk::FileFilter#add_suffix`)
  # or on their mime type (with `Gtk::FileFilter#add_mime_type`).
  #
  # Filtering by mime types handles aliasing and subclassing of mime
  # types; e.g. a filter for text/plain also matches a file with mime
  # type application/rtf, since application/rtf is a subclass of
  # text/plain. Note that `GtkFileFilter` allows wildcards for the
  # subtype of a mime type, so you can e.g. filter for image/\*.
  #
  # Normally, file filters are used by adding them to a `GtkFileChooser`
  # (see `Gtk::FileChooser#add_filter`), but it is also possible to
  # manually use a file filter on any `Gtk#FilterListModel` containing
  # `GFileInfo` objects.
  #
  # # GtkFileFilter as GtkBuildable
  #
  # The `GtkFileFilter` implementation of the `GtkBuildable` interface
  # supports adding rules using the `<mime-types>` and `<patterns>` and
  # `<suffixes>` elements and listing the rules within. Specifying a
  # `<mime-type>` or `<pattern>` or `<suffix>` has the same effect as
  # as calling
  # `Gtk::FileFilter#add_mime_type` or
  # `Gtk::FileFilter#add_pattern` or
  # `Gtk::FileFilter#add_suffix`.
  #
  # An example of a UI definition fragment specifying `GtkFileFilter`
  # rules:
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <object class="GtkFileFilter">
  #   <property name="name" translatable="yes">Text and Images</property>
  #   <mime-types>
  #     <mime-type>text/plain</mime-type>
  #     <mime-type>image/ *</mime-type>
  #   </mime-types>
  #   <patterns>
  #     <pattern>*.txt</pattern>
  #   </patterns>
  #   <suffixes>
  #     <suffix>png</suffix>
  #   </suffixes>
  # </object>
  # ```
  @[GObject::GeneratedWrapper]
  class FileFilter < Filter
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::FileFilter), instance_init, 0)
    end

    GICrystal.define_new_method(FileFilter, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `FileFilter`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, name : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FileFilter.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_file_filter_get_type
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

    # Creates a new `GtkFileFilter` with no rules added to it.
    #
    # Such a filter doesn’t accept any files, so is not
    # particularly useful until you add rules with
    # `Gtk::FileFilter#add_mime_type`,
    # `Gtk::FileFilter#add_pattern`,
    # `Gtk::FileFilter#add_suffix` or
    # `Gtk::FileFilter#add_pixbuf_formats`.
    #
    # To create a filter that accepts any file, use:
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # GtkFileFilter *filter = gtk_file_filter_new ();
    # gtk_file_filter_add_pattern (filter, "*");
    # ```
    def initialize
      # gtk_file_filter_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_file_filter_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Deserialize a file filter from a `GVariant`.
    #
    # The variant must be in the format produced by
    # `Gtk::FileFilter#to_gvariant`.
    def self.new_from_gvariant(variant : _) : self
      # gtk_file_filter_new_from_gvariant: (Constructor)
      # Returns: (transfer full)

      # Generator::HandmadeArgPlan
      variant = if !variant.is_a?(GLib::Variant)
                  GLib::Variant.new(variant).to_unsafe
                else
                  variant.to_unsafe
                end

      # C call
      _retval = LibGtk.gtk_file_filter_new_from_gvariant(variant)

      # Return value handling

      Gtk::FileFilter.new(_retval, GICrystal::Transfer::Full)
    end

    # Adds a rule allowing a given mime type to @filter.
    def add_mime_type(mime_type : ::String) : Nil
      # gtk_file_filter_add_mime_type: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_file_filter_add_mime_type(@pointer, mime_type)

      # Return value handling
    end

    # Adds a rule allowing a shell style glob to a filter.
    #
    # Note that it depends on the platform whether pattern
    # matching ignores case or not. On Windows, it does, on
    # other platforms, it doesn't.
    def add_pattern(pattern : ::String) : Nil
      # gtk_file_filter_add_pattern: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_file_filter_add_pattern(@pointer, pattern)

      # Return value handling
    end

    # Adds a rule allowing image files in the formats supported
    # by GdkPixbuf.
    #
    # This is equivalent to calling `Gtk::FileFilter#add_mime_type`
    # for all the supported mime types.
    def add_pixbuf_formats : Nil
      # gtk_file_filter_add_pixbuf_formats: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_file_filter_add_pixbuf_formats(@pointer)

      # Return value handling
    end

    # Adds a suffix match rule to a filter.
    #
    # This is similar to adding a match for the pattern
    # "*.@suffix".
    #
    # In contrast to pattern matches, suffix matches
    # are *always* case-insensitive.
    def add_suffix(suffix : ::String) : Nil
      # gtk_file_filter_add_suffix: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_file_filter_add_suffix(@pointer, suffix)

      # Return value handling
    end

    # Gets the attributes that need to be filled in for the `GFileInfo`
    # passed to this filter.
    #
    # This function will not typically be used by applications;
    # it is intended principally for use in the implementation
    # of `GtkFileChooser`.
    def attributes : Enumerable(::String)
      # gtk_file_filter_get_attributes: (Method)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGtk.gtk_file_filter_get_attributes(@pointer)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    # Gets the human-readable name for the filter.
    #
    # See `Gtk::FileFilter#name=`.
    def name : ::String?
      # gtk_file_filter_get_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_file_filter_get_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Sets a human-readable name of the filter.
    #
    # This is the string that will be displayed in the file chooser
    # if there is a selectable list of filters.
    def name=(name : ::String?) : Nil
      # gtk_file_filter_set_name: (Method | Setter)
      # @name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      LibGtk.gtk_file_filter_set_name(@pointer, name)

      # Return value handling
    end

    # Serialize a file filter to an `a{sv}` variant.
    def to_gvariant : GLib::Variant
      # gtk_file_filter_to_gvariant: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_file_filter_to_gvariant(@pointer)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::None)
    end
  end
end
