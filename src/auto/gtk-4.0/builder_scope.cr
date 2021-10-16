module Gtk
  # `GtkBuilderScope` is an interface to provide language binding support
  # to `GtkBuilder`.
  #
  # The goal of `GtkBuilderScope` is to look up programming-language-specific
  # values for strings that are given in a `GtkBuilder` UI file.
  #
  # The primary intended audience is bindings that want to provide deeper
  # integration of `GtkBuilder` into the language.
  #
  # A `GtkBuilderScope` instance may be used with multiple `GtkBuilder` objects,
  # even at once.
  #
  # By default, GTK will use its own implementation of `GtkBuilderScope`
  # for the C language which can be created via [ctor@Gtk.BuilderCScope.new].
  module BuilderScope
    abstract def to_unsafe
  end

  # :nodoc:
  class BuilderScope__Impl
    include BuilderScope

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
      LibGtk.gtk_builder_scope_get_type
    end

    # Cast a `GObject::Object` to `BuilderScope`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to BuilderScope")
    end

    # Cast a `GObject::Object` to `BuilderScope`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
