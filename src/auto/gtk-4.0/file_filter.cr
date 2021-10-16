require "./filter"
require "./buildable"

module Gtk
  # `GtkFileFilter` filters files by name or mime type.
  #
  # `GtkFileFilter` can be used to restrict the files being shown in a
  # `GtkFileChooser`. Files can be filtered based on their name (with
  # [method@Gtk.FileFilter.add_pattern] or [method@Gtk.FileFilter.add_suffix])
  # or on their mime type (with [method@Gtk.FileFilter.add_mime_type]).
  #
  # Filtering by mime types handles aliasing and subclassing of mime
  # types; e.g. a filter for text/plain also matches a file with mime
  # type application/rtf, since application/rtf is a subclass of
  # text/plain. Note that `GtkFileFilter` allows wildcards for the
  # subtype of a mime type, so you can e.g. filter for image/\*.
  #
  # Normally, file filters are used by adding them to a `GtkFileChooser`
  # (see [method@Gtk.FileChooser.add_filter]), but it is also possible to
  # manually use a file filter on any [class@Gtk.FilterListModel] containing
  # `GFileInfo` objects.
  #
  # # GtkFileFilter as GtkBuildable
  #
  # The `GtkFileFilter` implementation of the `GtkBuildable` interface
  # supports adding rules using the `<mime-types>` and `<patterns>` and
  # `<suffixes>` elements and listing the rules within. Specifying a
  # `<mime-type>` or `<pattern>` or `<suffix>` has the same effect as
  # as calling
  # [method@Gtk.FileFilter.add_mime_type] or
  # [method@Gtk.FileFilter.add_pattern] or
  # [method@Gtk.FileFilter.add_suffix].
  #
  # An example of a UI definition fragment specifying `GtkFileFilter`
  # rules:
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
  class FileFilter < Filter
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, name : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FileFilter.g_type, _n, _names, _values)
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

    def initialize
      # gtk_file_filter_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_file_filter_new
      @pointer = _retval
    end

    def self.new_from_gvariant(variant : _) : Gtk::FileFilter
      # gtk_file_filter_new_from_gvariant: (Constructor)
      # Returns: (transfer full)

      variant = GLib::Variant.new(variant) unless variant.is_a?(GLib::Variant)

      _retval = LibGtk.gtk_file_filter_new_from_gvariant(variant)
      Gtk::FileFilter.new(_retval, GICrystal::Transfer::Full)
    end

    def add_mime_type(mime_type : ::String) : Nil
      # gtk_file_filter_add_mime_type: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_file_filter_add_mime_type(self, mime_type)
    end

    def add_pattern(pattern : ::String) : Nil
      # gtk_file_filter_add_pattern: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_file_filter_add_pattern(self, pattern)
    end

    def add_pixbuf_formats : Nil
      # gtk_file_filter_add_pixbuf_formats: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_file_filter_add_pixbuf_formats(self)
    end

    def add_suffix(suffix : ::String) : Nil
      # gtk_file_filter_add_suffix: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_file_filter_add_suffix(self, suffix)
    end

    def attributes : Enumerable(::String)
      # gtk_file_filter_get_attributes: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_file_filter_get_attributes(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    def name : ::String?
      # gtk_file_filter_get_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_file_filter_get_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def name=(name : ::String?) : Nil
      # gtk_file_filter_set_name: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      LibGtk.gtk_file_filter_set_name(self, name)
    end

    def to_gvariant : GLib::Variant
      # gtk_file_filter_to_gvariant: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_file_filter_to_gvariant(self)
      GLib::Variant.new(_retval, GICrystal::Transfer::None)
    end
  end
end
