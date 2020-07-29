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
    C = 0.57
    S2 = 0.0 / C
    k1 = 1.0
    S1 = 1.5e-4 / C
    reaction1 = C * k1 * S1 * t
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
        ],
        
        [
            C,
            k1,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,k1,) = p.static
    (S1_,S2_,) = u 

    # Heta rules
    S2 = S2_ / C
    S1 = S1_ / C
    reaction1 = C * k1 * S1 * t
    
    #p.static .= [C,k1,]
    du .= [
      -reaction1,  # dS1_/dt
      reaction1,  # dS2_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,k1,) = integrator.p.static
        (S1_,S2_,) = u

        # Heta rules
        S2 = S2_ / C
        S1 = S1_ / C
        reaction1 = C * k1 * S1 * t
        
        # calculate amounts
        C_ = C
        reaction1_ = reaction1
        k1_ = k1

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events


### continous events


### event assignments


### OUTPUT ###

x00857 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00857 = x00857
)
tasks = ()

export models, tasks

end
