#= 
    This code was generated by heta-compiler of v0.5.8
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    C = 1.0
    k1 = 0.75
    S1 = 1e-4
    S2 = 2e-4
    reaction1 = C * k1 * S1 * S2
    k2 = 0.25
    S3 = 1e-4
    reaction2 = C * k2 * S3
    
    # save results

    return (
        [ 0.0 ], # init for fake variable
        [
            C,
            S1,
            S2,
            S3,
            k1,
            k2,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,S1,S2,S3,k1,k2,) = p.static
    () = u 

    # Heta rules
    reaction1 = C * k1 * S1 * S2
    reaction2 = C * k2 * S3
    
    #p.static .= [C,S1,S2,S3,k1,k2,]
    du .= [ 1.0 ] # RHS for fake variable
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,S1,S2,S3,k1,k2,) = integrator.p.static
        () = u

        # Heta rules
        reaction1 = C * k1 * S1 * S2
        reaction2 = C * k2 * S3
        
        # calculate amounts
        C_ = C
        S1_ = S1 * C
        S2_ = S2 * C
        S3_ = S3 * C
        reaction1_ = reaction1
        reaction2_ = reaction2
        k1_ = k1
        k2_ = k2

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events


### continous events


### event assignments


### OUTPUT ###

x00579 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00579 = x00579
)
tasks = ()

export models, tasks

end
