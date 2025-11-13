#ifndef LPN_ATTRIBUTES
#define LPN_ATTRIBUTES

include "LPN/LPNDialect.td"
include "mlir/IR/AttrTypeBase.td"

def LPN_LatencyAttr : AttrDef<LPN_Dialect, "latency"> {
  let summary = "Represents a transition latency";

  let description = [{
    A latency attribute represents the delay before a transition fires.
    This can be a constant or symbolic (IntSymbol).
  }];

  let parameters = (ins "double":$value);
  let assemblyFormat = "`<` $value `>`";
}

def LPN_IntSymbolAttr : AttrDef<LPN_Dialect, "int_symbol"> {
  let summary = "Represents a symbolic integer parameter";
  let description = [{
    Models symbolic integer values (similar to createIntSymbol in the Python LPN
    framework). Each symbol has a unique string identifier, optional concrete
    value, and optional bounds.
  }];
  let parameters = (ins
    "StringRef":$sym,
    "Optional<int>":$values,
    "Optional<int>":$lowerBound,
    "Optional<int>":$upperBound,
    "Optional<int>":$id
  );

  let assemblyFormat = [{
    `<` $sym (`,` $value^)? (`,` $lowerBound^)? (`,` $upperBound^)? (`,` $id^)? `>`
  }];
}

def LPN_StringAttr : AttrDef<LPN_Dialect, "string"> {
  let summary = "Simple string attribute for identifiers or names";
  let parameters = (ins "StringRef":$value);
  let assemblyFormat = "`<` $value `>`";
}

#endif // LPN_ATTRIBUTES