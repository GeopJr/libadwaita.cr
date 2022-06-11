require "../g_object-2.0/object"
require "./builder_scope"

module Gtk
  # A `GtkBuilderScope` implementation for the C language.
  #
  # `GtkBuilderCScope` instances use symbols explicitly added to @builder
  # with prior calls to `Gtk::BuilderCScope#add_callback_symbol`.
  # If developers want to do that, they are encouraged to create their
  # own scopes for that purpose.
  #
  # In the case that symbols are not explicitly added; GTK will uses
  # `GModule`’s introspective features (by opening the module %NULL) to
  # look at the application’s symbol table. From here it tries to match
  # the signal function names given in the interface description with
  # symbols in the application.
  #
  # Note that unless `Gtk::BuilderCScope#add_callback_symbol` is
  # called for all signal callbacks which are referenced by the loaded XML,
  # this functionality will require that `GModule` be supported on the platform.
  @[GObject::GeneratedWrapper]
  class BuilderCScope < GObject::Object
    include BuilderScope

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::BuilderCScopeClass), class_init,
        sizeof(LibGtk::BuilderCScope), instance_init, 0)
    end

    GICrystal.define_new_method(BuilderCScope, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `BuilderCScope`.
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
      LibGtk.gtk_builder_cscope_get_type
    end

    # Adds the @callback_symbol to the scope of @builder under the
    # given @callback_name.
    #
    # Using this function overrides the behavior of
    # `Gtk::Builder#create_closure` for any callback symbols that
    # are added. Using this method allows for better encapsulation as it
    # does not require that callback symbols be declared in the global
    # namespace.
    def add_callback_symbol(callback_name : ::String, callback_symbol : GObject::Callback) : Nil
      # gtk_builder_cscope_add_callback_symbol: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_builder_cscope_add_callback_symbol(@pointer, callback_name, callback_symbol)

      # Return value handling
    end
  end
end
