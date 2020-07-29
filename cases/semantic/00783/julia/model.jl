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
    S2 = 1.5
    k2 = 50.0
    C = k2 * ^(9.0, (-1.0))
    k1 = 0.5
    S1 = 1.0
    reaction1 = C * k1 * S1
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
        ],
        
        [
            C,
            k1,
            k2,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,k1,k2,) = p.static
    (S1_,S2_,) = u 

    # Heta rules
    S2 = S2_ / C
    S1 = S1_ / C
    reaction1 = C * k1 * S1
    
    #p.static .= [C,k1,k2,]
    du .= [
      -reaction1,  # dS1_/dt
      reaction1,  # dS2_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,k1,k2,) = integrator.p.static
        (S1_,S2_,) = u

        # Heta rules
        S2 = S2_ / C
        S1 = S1_ / C
        reaction1 = C * k1 * S1
        
        # calculate amounts
        C_ = C
        reaction1_ = reaction1
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

x00783 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00783 = x00783
)
tasks = ()

export models, tasks

end
