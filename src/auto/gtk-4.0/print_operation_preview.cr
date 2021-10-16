module Gtk
  # `GtkPrintOperationPreview` is the interface that is used to
  # implement print preview.
  #
  # A `GtkPrintOperationPreview` object is passed to the
  # [signal@Gtk.PrintOperation::preview] signal by
  # [class@Gtk.PrintOperation].
  module PrintOperationPreview
    def end_preview : Nil
      # gtk_print_operation_preview_end_preview: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_preview_end_preview(self)
    end

    def is_selected(page_nr : Int32) : Bool
      # gtk_print_operation_preview_is_selected: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_operation_preview_is_selected(self, page_nr)
      GICrystal.to_bool(_retval)
    end

    def render_page(page_nr : Int32) : Nil
      # gtk_print_operation_preview_render_page: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_preview_render_page(self, page_nr)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class PrintOperationPreview__Impl
    include PrintOperationPreview

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
      LibGtk.gtk_print_operation_preview_get_type
    end

    # Cast a `GObject::Object` to `PrintOperationPreview`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to PrintOperationPreview")
    end

    # Cast a `GObject::Object` to `PrintOperationPreview`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
